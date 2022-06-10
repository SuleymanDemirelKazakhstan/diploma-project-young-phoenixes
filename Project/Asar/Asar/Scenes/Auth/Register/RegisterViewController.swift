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
    
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var phoneTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var actionButton: BottomActionButton!
    
    init(navigationDelegate: RegisterViewControllerDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        headerView.configureTexts(titleText: L10n.registrationTitle, subtitleText: L10n.subtitleOfRegistrationTitle)
        setupCheckBoxView()
        configureTextFields()
        actionButton.configureTitle(text: L10n.makeRegistrationButton)
        passwordTextField.isSecureTextEntry = true

    }
    
    private func configureTextFields() {
        Utilities.styleTextField(phoneTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    private func setupCheckBoxView() {
        let view = CheckBoxView.loadFromNib()
        view.setText(L10n.privacyPolicy, part: "условиями сервиса и политикой конфидициальности")
        stackView.addArrangedSubview(view)
    }
    
    private func showError(_ message: String) {
    // add alert show
    }
}

// MARK: - BottomActionButtonDelegate

extension RegisterViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        if let phone = phoneTextField.text, !phone.isEmpty {
            let number = "+7\(phone)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] result in
                guard result else { return }
                DispatchQueue.main.async {
                    self?.navigationDelegate?.registerButtonDidTap()
                }
            }
        }
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showError("Error creating user")
            }
            else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["email": email,
                                                          "uid": result!.user.uid ]) { (error) in
                    if error != nil {
                        self.showError("Error saving user data")
                    }
                }
            }
        }
    }
}
