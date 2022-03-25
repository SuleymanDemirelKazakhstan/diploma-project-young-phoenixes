//
//  CoordinatorFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

final class CoordinatorFactory {
    func makeAuthCoordinator(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory) -> AuthCoordinator {
        let coordinator = AuthCoordinator(router: router, cordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
        return coordinator
    }
}
