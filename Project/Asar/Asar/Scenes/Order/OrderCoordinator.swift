//
//  OrderCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import Foundation

final class OrderCoordinator: BaseCoordinator {
    override func start() {
        showOrderViewController()
    }
    
    private func showOrderViewController() {
        let vc = OrderViewController()
        router.setRootModule(vc)
    }
}
