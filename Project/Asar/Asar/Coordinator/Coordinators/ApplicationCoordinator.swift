//
//  ApplicationCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
    private let moduleFactory: ModuleFactory = ModuleFactory()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start(launchInstructor: LaunchInstructor) {
        switch launchInstructor {
        case .auth:
            runAuthFlow()
        case .onboarding:
            runOnboardingFlow()
        case .main:
            runMainFlow()
        }
    }
    
    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        self.addDependency(coordinator)
        coordinator.start()
    }
}
