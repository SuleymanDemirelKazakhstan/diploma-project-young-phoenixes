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
    func registerDidTap()
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
        headerView.configureTexts(titleText: "Добро пожаловать!", subtitleText: "Введите данные, указанные при регистрации")
        loginButton.layer.cornerRadius = 10
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {

    }
}
