//
//  AuthCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class AuthCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: ModuleFactory

    init(router: Router,cordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory) {
        self.coordinatorFactory = cordinatorFactory
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }
    
    override func start() {
        showLoginViewController()
    }
    
    private func showLoginViewController() {
        let loginVC = moduleFactory.makeLoginViewController()
        router.setRootModule(loginVC)
    }
    
    private func showRegisterViewController() {
        
    }
    
    private func runForgetPasswordFlow() {
        
    }
}
