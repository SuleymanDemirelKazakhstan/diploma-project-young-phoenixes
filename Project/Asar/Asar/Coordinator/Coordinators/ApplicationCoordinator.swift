//
//  ApplicationCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
    private let moduleFactory: ModuleFactory = ModuleFactory()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start(launchInstructor: LaunchInstructor) {
        switch launchInstructor {
        case .auth:
            runAuthFlow(launch: .auth)
        case .onboarding:
            runAuthFlow(launch: .onboarding)
        case .main:
            showMain(viewControllers: [runHomeMainFlow(), runOrdersFlow(), runMyOrdersFlow(), runProfileFlow()])
        }
    }
    
    private func showMain(viewControllers: [UIViewController]) {
        let main = moduleFactory.makeMain(viewControllers: viewControllers)
        router.setRootModule(main, isNavigationBarHidden: true)
    }
    
    private func runHomeMainFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeHomeMainCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runOrdersFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeOrderCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runMyOrdersFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeMyOrdersCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runProfileFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeProfileCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runAuthFlow(launch: LaunchInstructor) {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory, launchInsractor: launch)
        self.addDependency(coordinator)
        coordinator.start()
    }
}
