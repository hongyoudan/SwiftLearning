//
//  HomeController.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var lbUserInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        getUserInfo()
    }

    // 获取用户信息
    func getUserInfo() {
        // 从偏好设置中获取用户信息
        let userInfo = PreferenceUtils.getUserInfo()!
        // 显示用户信息，只获取手机号后4位
        lbUserInfo.text = "欢迎回来：\(userInfo.mobile.suffix(4))"
    }
    
    // 点击退出登录按钮
    @IBAction func btnLogout(_ sender: UIButton) {
        // 弹窗：您确定要退出登录吗？
        let alert = UIAlertController(title: "提示", message: "您确定要退出登录吗？", preferredStyle: .alert)
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let messageAttrString = NSMutableAttributedString(string: "您确定要退出登录吗？", attributes: messageFont)
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        // 确定按钮
        let okAction = UIAlertAction(title: "确定", style: .default) { (action) in
            self.logout()
        }
        // 取消按钮
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        // 添加按钮
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        // 显示弹窗
        present(alert, animated: true, completion: nil)
    }

    // 退出登录
    func logout() {
        // 清空用户信息
        PreferenceUtils.removeUserInfo()
        // 跳转到登录页
        SceneDelegate.shared.goLogin()
    }
    
    // 点击跳转图片列表界面
    @IBAction func btnGoImageList(_ sender: UIButton) {
        // 实例化一个名为 ImageListController 的视图控制器
        // 这个视图控制器在应用的 Storyboard 中定义，并设置标识符"ImageListController"
        // 然后，该方法通过强制类型转换 as! ImageListController 将这个视图控制器实例转换为 ImageListController 类型
        let imageListController = storyboard?.instantiateViewController(identifier: "ImageListController") as! ImageListController
        // 将实例化的视图控制器推送到导航控制器（navigationController）的栈中，实现页面跳转
        // 这里的 animated: true 表示这个跳转过程是动画化的
        navigationController?.pushViewController(imageListController, animated: true)
    }
}
