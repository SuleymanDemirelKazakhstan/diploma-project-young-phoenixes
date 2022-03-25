//
//  ApplicationCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    private var launchInstractor = LaunchInstructor.configure()
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let moduleFactory: ModuleFactory = ModuleFactory()
    
    init(coordinatorFactory: CoordinatorFactory, router: Router) {
        self.coordinatorFactory = coordinatorFactory
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
        
    }
    
    private func runAuthFlow() {
//        router.push()
    }
    
    private func runMainFlow() {
        
    }
}
