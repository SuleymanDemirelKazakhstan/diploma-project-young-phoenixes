//
//  HomeCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import Foundation

class HomeMainCoordinator: BaseCoordinator {
    override func start() {
        showHomeMainViewController()
    }
    
    private func showHomeMainViewController() {
        let vc = HomeMainViewController()
        router.setRootModule(vc)
    }
}
