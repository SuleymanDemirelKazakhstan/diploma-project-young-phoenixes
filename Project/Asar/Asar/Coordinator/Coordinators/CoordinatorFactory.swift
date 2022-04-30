//
//  CoordinatorFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//
import UIKit

final class CoordinatorFactory {
    func makeAuthCoordinator(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory) -> AuthCoordinator {
        let coordinator = AuthCoordinator(router: router, cordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        return coordinator
    }
    
    func makeMainCoordinator() {
        
    }
    
    func makeProfileCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "Profile"
        let coordinator = ProfileCoordinator(router: Router(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeOrderCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "Order"
        let coordinator = OrderCoordinator(router: Router(navigationController: navigationController))
        return (coordinator, navigationController)
    }
}
