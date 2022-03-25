//
//  Router.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

protocol RouterProtocol {
    
}

final class Router: RouterProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func present(_ viewController: UIViewController, animated: Bool = true) {
        if #available(iOS 13.0, *) {
            present(viewController, animated: animated, modalPresentationStyle: .automatic)
        } else {
            present(viewController, animated: animated, modalPresentationStyle: .fullScreen)
        }
    }

    func present(_ viewController: UIViewController, animated: Bool, modalPresentationStyle: UIModalPresentationStyle) {
        viewController.modalPresentationStyle = modalPresentationStyle
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.present(viewController, animated: animated)
        }
    }

    func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.dismiss(animated: animated, completion: completion)
        }
    }

    func popToModule(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.popToViewController(viewController, animated: animated)
            completion()
        }
    }

    func push(_ viewController: UIViewController, animated: Bool = true, hideBottomBarWhenPushed: Bool = true) {
        guard viewController is UINavigationController == false else {
            assertionFailure("Deprecated push UINavigationController")
            return
        }
        viewController.hidesBottomBarWhenPushed = hideBottomBarWhenPushed
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.pushViewController(viewController, animated: animated)
        }
    }

    func popModule(animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.popViewController(animated: animated)
        }
    }

    func setRootModule(_ viewController: UIViewController, isNavigationBarHidden: Bool = false) {
        navigationController.setViewControllers([viewController], animated: false)
        navigationController.isNavigationBarHidden = isNavigationBarHidden
    }

    func popToRootModule(animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.popToRootViewController(animated: animated)
            completion()
        }
    }
}
