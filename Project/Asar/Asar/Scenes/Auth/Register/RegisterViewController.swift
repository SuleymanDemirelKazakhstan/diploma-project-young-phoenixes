//
//  RegisterViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.04.2022.
//

import UIKit
import FirebaseAuth
import Firebase

protocol RegisterViewControllerDelegate: AnyObject {
    func registerButtonDidTap()
}

class RegisterViewController: UIViewController {
    private weak var navigationDelegate: RegisterViewControllerDelegate?
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    init(navigationDelegate: RegisterViewControllerDelegate) {
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
        headerView.configureTexts(titleText: "Регистрация", subtitleText: "Введите номер телефона, чтобы начать регистрацию")
        
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
        
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }
        
        return nil
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            // Create cleaned versions of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { [self] (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email":email, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    navigationDelegate?.registerButtonDidTap()
                }
            }
        }
    }
    
    private func showError(_ message: String) {
        // add alert show
    }
}
