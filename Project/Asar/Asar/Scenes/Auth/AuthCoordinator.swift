//
//  AuthCoordinator.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

final class AuthCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: ModuleFactory

    init(router: Router, cordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory) {
        self.coordinatorFactory = cordinatorFactory
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }

    override func start() {
        showLoginViewController()
    }

    private func showLoginViewController() {
        let loginVC = moduleFactory.makeLoginViewController(navigationDelegate: self)
        router.setRootModule(loginVC)
    }
    
    private func showRegisterViewController() {
        let registerVC = moduleFactory.makeRegisterViewController(navigationDelegate: self)
        router.setRootModule(registerVC)
    }
    
    private func showOnboardingViewController() {
        let onboarding = moduleFactory.makeOnboardingViewController()
        router.setRootModule(onboarding)
    }
    
    private func showMainViewController() {
        let main = moduleFactory.makeMain(viewControllers: [runHomeMainFlow(), runOrdersFlow(), runMyOrdersFlow(), runProfileFlow()])
        router.setRootModule(main)
    }
    
    private func showRegisterConfirmViewController() {
        let registerConfirm = moduleFactory.makeRegisterConfirmViewController(navigationDelegate: self)
        router.push(registerConfirm)
    }
    
    private func runForgetPasswordFlow() {
        
    }
    
    private func runHomeMainFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeHomeMainCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runOrdersFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeOrderCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runMyOrdersFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeMyOrdersCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
    
    private func runProfileFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeProfileCoordinator()
        coordinator.start()
        addDependency(coordinator)
        return module
    }
}

// MARK: - LoginViewControllerDelegate
extension AuthCoordinator: LoginViewControllerDelegate {
    func loginDidTap() {
        showMainViewController()
    }
    
    func forgetPasswordDidTap() {
        
    }
    
    func registerDidTap() {
        
    }
}

// MARK: - RegisterViewControllerDelegate

extension AuthCoordinator: RegisterViewControllerDelegate {
    func registerButtonDidTap() {
        showRegisterConfirmViewController()
    }
}

// MARK: - RegisterConfirmNavigationDelegate

extension AuthCoordinator: RegisterConfirmNavigationDelegate {
    func confirmDidTap() {
        showMainViewController()
    }
}
