//
//  OrderCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import Foundation

final class OrderCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
    
    override func start() {
        showOrderViewController()
    }
    
    private func showOrderViewController() {
        let vc = OrderViewController(store: .init(), navigationDelegate: self)
        router.setRootModule(vc)
    }
    
    private func runMapFlow() {
        let coordinator = coordinatorFactory.makeMapCoordinator(router: router, delegate: self)
        addDependency(coordinator)
        coordinator.start()
    }
}

extension OrderCoordinator: OrderNavigationDelegate {
    func closeDidTap(_ viewController: OrderViewController) {
        
    }
    
    func formDidVerify(_ viewController: OrderViewController) {
    
    }
    
    func mapDidTap(_ viewController: OrderViewController) {
        runMapFlow()
    }
}

extension OrderCoordinator: MapCoordinatorDelegate {
    func didClose(_ coordinator: MapCoordinator) {
        router.popToRootModule()
        removeDependency(coordinator)
    }
}
