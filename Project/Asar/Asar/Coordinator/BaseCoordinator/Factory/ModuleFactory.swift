//
//  ModuleFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

final class ModuleFactory {
    func makeLoginViewController(navigationDelegate: LoginViewControllerDelegate) -> UIViewController {
        return LoginViewController(navigationDelegate: navigationDelegate)
    }
    
    func makeOnboardingViewController() -> UIViewController {
        return OnboardingViewController()
    }
    
    func makeMainViewController() -> UIViewController {
        return MainViewController()
    }
    
    func makeRegisterViewController(navigationDelegate: RegisterViewControllerDelegate) -> UIViewController {
        return RegisterViewController(navigationDelegate: navigationDelegate)
    }
}
