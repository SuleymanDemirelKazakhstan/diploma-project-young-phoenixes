//
//  AuthCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class AuthCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let modulFactory: ModuleFactory

    init(router: RouterProtocol, cordinatorFactory: CoordinatorFactoryProtocol, moduleFactory: ModuleFactory) {
        self.router = router
        self.coordinatorFactory = cordinatorFactory
        self.modulFactory = modulFactory
    }
    
    override func start() {
        showLoginViewController()
    }
    
    private func showLoginViewController() {
        
    }
    
    private func showRegisterViewController() {
        
    }
    
    private func runForgetPasswordFlow() {
        
    }
}
