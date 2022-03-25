//
//  ApplicationCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private let moduleFactory: ModuleFactory = ModuleFactory()
    
    init(coordinatorFactory: CoordinatorFactory, router: Router) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }
    
    override func start() {
        
    }
    
    // run flows
    
}
