//
//  MyOrdersCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import Foundation

class MyOrdersCoordinator: BaseCoordinator {
    override func start() {
        showMyOrdersViewController()
    }
    
    private func showMyOrdersViewController() {
        let vc = MyOrdersViewController(store: .init())
        router.setRootModule(vc)
    }
}
