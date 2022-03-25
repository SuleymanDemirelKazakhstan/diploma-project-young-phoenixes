//
//  BaseCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
}

class BaseCoordinator: Coordinator {
    let router: Router
    var childCoordinators = [Coordinator]()
    
    init(router: Router) {
        self.router = router
    }
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    
    func start() {}
}
