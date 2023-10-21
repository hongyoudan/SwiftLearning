//
//  ViewController.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var tfMobile: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 点击登录按钮
    @IBAction func btnLogin(_ sender: UIButton) {
        
        // 获取输入框中的手机号和密码
        let mobile = tfMobile.text!
        let password = tfPassword.text!
        
        // 定义手机号和密码的正则表达式
        let mobileRegex = "^(1[0-9])\\d{9}$" // 11位数字
        let passwordRegex = "^[a-zA-Z0-9]{6,16}$" // 6-16位数字或字母
        // 创建NSPredicate对象进行校验
        let mobilePredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        // 判断手机号和密码是否为空，手机号格式是否正确（正则），密码格式是否正确（6-16位数字或字母）
        if mobile == "" || password == "" || !mobilePredicate.evaluate(with: mobile) || !passwordPredicate.evaluate(with: password){
            showAlert(message: "手机号或密码错误！")
            return
        }
        
        // 显示加载状态
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        
        // 延迟 1.5 秒后执行登录操作
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            // 隐藏加载状态
            self.loadingIndicator.stopAnimating()
            
            // 判断手机号和密码是否正确
            if mobile == "15160760810" && password == "admin123" {
                // 登录成功，保存用户信息
                let userInfo = UserInfo(mobile: mobile)
                PreferenceUtils.saveUserInfo(userInfo: userInfo)
                // 跳转到首页
                SceneDelegate.shared.goHome()
            } else {
                self.showAlert(message: "手机号或密码错误！")
            }
        }
        
    }
    
    // 显示提示框的方法
    func showAlert(message: String) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont)
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

