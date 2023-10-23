//
//  SceneDelegate.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // 这是一个单例模式，用于在不同的 Controller 之间进行跳转
    open class var shared: SceneDelegate {
        get {
            // 这里的 UIApplication.shared.delegate 是一个 SceneDelegate 类型的对象
            // 但是我们需要的是 SceneDelegate 的单例对象，所以需要进行类型转换
            return UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        }
    }
    
    // 跳转到登录界面
    func goLogin(){
        setRootViewController(storyboardName: "Main", controllerName: "Login")
    }
    
    // 跳转到首页
    func goHome(){
        setRootViewController(storyboardName: "Main", controllerName: "HomeNavigationController")
    }
    
    // 跳转到图片列表界面
    func goImageList(){
        setRootViewController(storyboardName: "Main", controllerName: "ImageListController")
    }

    // 设置根控制器
    func setRootViewController(storyboardName: String, controllerName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil) // 这里的 storyboardName 是 xxx.storyboard 的名字
        let controller = storyboard.instantiateViewController(withIdentifier: controllerName) // 这里的 controllerName 是 xxx.storyboard 中的 Controller 的 Storyboard ID
        window?.rootViewController = controller // 这里的 window 是在 SceneDelegate 中定义的，用于跳转到下一个 Controller
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

