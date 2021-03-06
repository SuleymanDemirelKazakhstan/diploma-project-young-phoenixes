//
//  CoordinatorFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//
import UIKit

final class CoordinatorFactory {
    func makeAuthCoordinator(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory, launchInsractor: LaunchInstructor) -> AuthCoordinator {
        let coordinator = AuthCoordinator(router: router, cordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory, launchInstractor: launchInsractor)
        return coordinator
    }
    
    func makeHomeMainCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
//        navigationController.tabBarItem.title = "HomeMain"
        navigationController.tabBarItem.image = Asset.home.image
        let coordinator = HomeMainCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
        
    func makeOrderCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
//        navigationController.tabBarItem.title = "Order"
        navigationController.tabBarItem.image = Asset.plus.image
        let coordinator = OrderCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeMyOrdersCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
//        navigationController.tabBarItem.title = "MyOrders"
        navigationController.tabBarItem.image = Asset.note.image
        let coordinator = MyOrdersCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeProfileCoordinator() -> (coordinator: Coordinator, module: UIViewController) {
        let navigationController = UINavigationController()
//        navigationController.tabBarItem.title = "Profile"
        navigationController.tabBarItem.image = Asset.user.image
        let coordinator = ProfileCoordinator(router: .init(navigationController: navigationController))
        return (coordinator, navigationController)
    }
    
    func makeMapCoordinator(router: Router, delegate: MapCoordinatorDelegate) -> Coordinator {
        return MapCoordinator(delegate: delegate, router: router)
    }
}
