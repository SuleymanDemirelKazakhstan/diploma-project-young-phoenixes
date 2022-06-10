//
//  LoginViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit
import Firebase

protocol LoginViewControllerDelegate: AnyObject {
    func loginDidTap()
    func forgetPasswordDidTap()
}

class LoginViewController: UIViewController {
    private weak var navigationDelegate: LoginViewControllerDelegate?
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
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
    }
    
    private func setupUI() {
        headerView.configureTexts(titleText: L10n.welcomeTitle, subtitleText: "")
        loginButton.layer.cornerRadius = 10
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
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
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
