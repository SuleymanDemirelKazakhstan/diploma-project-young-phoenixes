//
//  ProfileCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import Foundation

final class ProfileCoordinator: BaseCoordinator {
    override func start() {
        showProfileViewController()
    }
    
    private func showProfileViewController() {
        let vc = ProfileViewController()
        router.setRootModule(vc)
    }
}
