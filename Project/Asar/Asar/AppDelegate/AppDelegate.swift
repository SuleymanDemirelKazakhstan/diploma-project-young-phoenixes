//
//  AppDelegate.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = ApplicationCoordinator(router: Router(rootController: self.rootController), coordinatorFactory: CoordinatorFactory())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.applicationCoordinator.start()
        return true
    }
}

