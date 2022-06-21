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
    private let launchInstractor: LaunchInstructor
    private var viewState: ViewState?

    init(router: Router, cordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory, launchInstractor: LaunchInstructor) {
        self.coordinatorFactory = cordinatorFactory
        self.moduleFactory = moduleFactory
        self.launchInstractor = launchInstractor
        super.init(router: router)
    }

    override func start() {
        switch launchInstractor {
        case .auth:
            showLoginViewController(viewState: nil)
        case .onboarding:
            showOnboardingViewController()
        default:
            break
        }
    }

    private func showLoginViewController(viewState: ViewState?) {
        let loginVC = moduleFactory.makeLoginViewController(viewState: viewState, navigationDelegate: self)
        router.setRootModule(loginVC)
    }
    
    private func showRegisterViewController() {
        let registerVC = moduleFactory.makeRegisterViewController(navigationDelegate: self)
        router.setRootModule(registerVC)
    }
    
    private func showOnboardingViewController() {
        let onboarding = moduleFactory.makeOnboardingViewController(delegate: self)
        router.setRootModule(onboarding)
    }
    
    private func showRoleChooseViewController() {
        let roleChoose = moduleFactory.makeRoleChooseViewController(navigationDelegate: self)
        router.push(roleChoose, animated: true)
    }
    
    private func showMainViewController(viewState: ViewState) {
        let main = moduleFactory.makeMain(viewControllers: viewState == .client ? [runHomeMainFlow(), runOrdersFlow(), runMyOrdersFlow(), runProfileFlow()] : [runHomeMainFlow(), runMyOrdersFlow(), runProfileFlow()])
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
    func loginDidTap(viewState: ViewState) {
        showMainViewController(viewState: viewState)
    }
    
    func forgetPasswordDidTap() {
        showRegisterViewController()
    }
    
    func registerDidTap() {
        
    }
}

// MARK: - RegisterViewControllerDelegate

extension AuthCoordinator: RegisterViewControllerDelegate {
    func registerButtonDidTap() {
        showRegisterConfirmViewController()
    }
    
    func loginButtonDidTap() {
        showLoginViewController(viewState: nil)
    }
}

// MARK: - RegisterConfirmNavigationDelegate

extension AuthCoordinator: RegisterConfirmNavigationDelegate {
    func confirmDidTap() {
//        showMainViewController()
        showRoleChooseViewController()
    }
}

// MARK: - OnboardingNavigationDelegate

extension AuthCoordinator: OnboardingNavigationDelegate {
    func showLoginPage() {
        showLoginViewController(viewState: nil)
    }
}

// MARK: - RoleChooseViewDelegate

extension AuthCoordinator: RoleChooseViewDelegate {
    func showMainPage(viewState: ViewState) {
        showLoginViewController(viewState: viewState)
    }
}
