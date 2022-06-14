//
//  LoginViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit
import Firebase
import iOSUtilitiesSource

protocol LoginViewControllerDelegate: AnyObject {
    func loginDidTap()
    func forgetPasswordDidTap()
}

class LoginViewController: UIViewController {
    private weak var navigationDelegate: LoginViewControllerDelegate?
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var actionView: BottomActionButton!
    
    init(navigationDelegate: LoginViewControllerDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    private func setupUI() {
        headerView.configureTexts(titleText: L10n.welcomeTitle, subtitleText: "")
        actionView.delegate = self
        actionView.configureTitle(text: "Войти")
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        passwordTextField.isSecureTextEntry = true
    }
    
    func validateFields() -> String? {
        // Check that all fields are filled in
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }
    
    private func actionButtonTapped() {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error!)
            }
            else {
                self.navigationDelegate?.loginDidTap()
            }
        }
    }
}

extension LoginViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        actionButtonTapped()
    }
}
