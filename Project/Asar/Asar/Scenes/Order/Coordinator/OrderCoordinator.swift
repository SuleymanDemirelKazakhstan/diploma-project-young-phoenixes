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
}

extension OrderCoordinator: OrderNavigationDelegate {
    func closeDidTap(_ viewController: OrderViewController) {
        
    }
    
    func formDidVerify(_ viewController: OrderViewController) {
    
    }
    
    func mapDidTap(_ viewController: OrderViewController) {
        MapCoordinator(router: router).start()
    }
}
