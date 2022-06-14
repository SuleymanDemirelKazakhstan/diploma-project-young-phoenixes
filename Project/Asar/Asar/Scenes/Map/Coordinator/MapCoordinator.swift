//
//  MapCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 13.06.2022.
//

import Foundation

protocol MapCoordinatorDelegate: AnyObject {
    func didClose(_ coordinator: MapCoordinator)
}

final class MapCoordinator: BaseCoordinator {
    private weak var delegate: MapCoordinatorDelegate?
    
    init(delegate: MapCoordinatorDelegate, router: Router) {
        self.delegate = delegate
        super.init(router: router)
    }
    override func start() {
        showMapViewController()
    }
    
    private func showMapViewController() {
        let vc = MapViewControler(store: .init(), navigationDelegate: self)
        router.push(vc)
    }
}

extension MapCoordinator: MapViewNavigationDelegate {
    func backButtonTapped(_ viewController: MapViewControler) {
        delegate?.didClose(self)
    }

    func actionButtonTapped(_ viewController: MapViewControler) {
        delegate?.didClose(self)
        guard let viewController = router.navigationController.viewControllers.compactMap({ $0 as? OrderViewController }).first else { return }
        viewController.mapSelected()
    }
}


