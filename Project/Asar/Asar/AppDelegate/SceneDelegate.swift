//
//  SceneDelegate.swift
//  Asar
//
//  Created by Abylbek Khassenov on 01.04.2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            fatalError("rootViewController must be NavigationController")
        }
        return navigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = ApplicationCoordinator(router: Router(navigationController: rootController))

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
//        var onboardingWasShown = Auth.auth().currentUser == nil
        let launchInstructor: LaunchInstructor = LaunchInstructor.configure(tutorialWasShown: Auth.auth().currentUser != nil, isAutorized: Auth.auth().currentUser != nil)
        self.applicationCoordinator.start(launchInstructor: launchInstructor)
    }
}
