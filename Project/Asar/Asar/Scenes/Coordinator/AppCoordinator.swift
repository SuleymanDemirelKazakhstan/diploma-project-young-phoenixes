//
//  AppCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 14.03.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthWelcomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
