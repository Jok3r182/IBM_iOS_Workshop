//
//  SceneDelegate.swift
//  IBM_iOS_Workshop
//
//  Created by Matas Paulius Drėgva on 10/04/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let initialViewController: UIViewController
        
        if isUserLoggedIn() {
            let storyboard = UIStoryboard(name: StoryboardIdentifier.userProfileStoryboard.rawValue, bundle: nil)
            initialViewController = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifier.userProfileViewController.rawValue)
        } else {
            let storyboard = UIStoryboard(name: StoryboardIdentifier.loginStoryboard.rawValue, bundle: nil)
            initialViewController = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifier.loginViewController.rawValue)
        }
        
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
    
    func isUserLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}

