//
//  MapCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 13.06.2022.
//

import Foundation

final class MapCoordinator: BaseCoordinator {
    override func start() {
        showMapViewController()
    }
    
    private func showMapViewController() {
        let vc = MapViewControler(store: .init())
        router.push(vc)
    }
}
