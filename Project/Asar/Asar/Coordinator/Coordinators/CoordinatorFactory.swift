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
    
    func makeHomeMainCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "HomeMain"
        let coordinator = HomeMainCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
        
    func makeOrderCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "Order"
        let coordinator = OrderCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeMyOrdersCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "MyOrders"
        let coordinator = MyOrdersCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeProfileCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.title = "Profile"
        let coordinator = ProfileCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
}
