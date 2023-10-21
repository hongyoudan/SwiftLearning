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
}
