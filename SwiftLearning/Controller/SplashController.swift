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
            SceneDelegate.shared.setRootViewController(storyboardName: "Main", controllerName: "Login")
        }
    }
}
