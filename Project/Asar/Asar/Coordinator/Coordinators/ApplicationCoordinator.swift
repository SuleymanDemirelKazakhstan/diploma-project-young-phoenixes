//
//  ApplicationCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    private var launchInstractor = LaunchInstructor.configure()
    private let coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
    private let moduleFactory: ModuleFactory = ModuleFactory()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        switch launchInstractor {
        case .onboarding:
            runOnboardingFlow()
        case .auth:
            runAuthFlow()
        case .main:
            runMainFlow()
        }
    }
    
    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        coordinator.start()
    }
    
    private func runAuthFlow() {
        
    }
    
    private func runMainFlow() {
        
    }
}
