//
//  ModuleFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

final class ModuleFactory {
    func makeMain(viewControllers: [UIViewController]) -> UIViewController {
        let containerController = ContainerController(viewControllers: viewControllers)
        let mainViewController = MainViewController(containerController: containerController)
        containerController.delegate = mainViewController
        return mainViewController
    }
    
    func makeLoginViewController(viewState: ViewState?,navigationDelegate: LoginViewControllerDelegate) -> UIViewController {
        return LoginViewController(navigationDelegate: navigationDelegate, viewState: viewState)
    }
    
    func makeOnboardingViewController(delegate: OnboardingNavigationDelegate) -> UIViewController {
        return OnboardingViewController(delegate: delegate)
    }
    
    func makeRegisterViewController(navigationDelegate: RegisterViewControllerDelegate) -> UIViewController {
        return RegisterViewController(navigationDelegate: navigationDelegate)
    }
    
    func makeRegisterConfirmViewController(navigationDelegate: RegisterConfirmNavigationDelegate) -> UIViewController {
        return RegisterConfirmViewController(navigationDelegate: navigationDelegate)
    }
    
    func makeRoleChooseViewController(navigationDelegate: RoleChooseViewDelegate) -> UIViewController {
        return RoleChooseViewController(navigationDelegate: navigationDelegate)
    }
}
