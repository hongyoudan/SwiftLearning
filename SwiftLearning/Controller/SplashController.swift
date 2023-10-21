//
//  SplashController.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 延迟 2 秒后跳转到下一个 Controller
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            // 判断用户是否登录
            if PreferenceUtils.checkIsLogin() {
                // 已登录，跳转到首页
                SceneDelegate.shared.goHome()
            } else {
                // 未登录，跳转到登录页
                SceneDelegate.shared.goLogin()
            }
        }
    }
}
