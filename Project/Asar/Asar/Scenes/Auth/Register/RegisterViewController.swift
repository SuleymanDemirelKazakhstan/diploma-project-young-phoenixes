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
    func loginButtonDidTap()
}

class RegisterViewController: UIViewController {
    private weak var navigationDelegate: RegisterViewControllerDelegate?
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var phoneTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var actionButton: BottomActionButton!
    @IBOutlet private var bottomTittle: UILabel!
    @IBOutlet private var bottomButton: UIButton!
    
    @IBAction func bottomButtonDidTap(_ sender: UIButton) {
        navigationDelegate?.loginButtonDidTap()
    }
    
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
        actionButton.buttonEnabled = false
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        bottomTittle.text = "Do you have an account?"
        bottomButton.setTitle("Login", for: .normal)
        phoneTextField.placeholder = L10n.orderTelephoneNumberPlaceholder
        emailTextField.placeholder = L10n.loginMailPlaceholder
        passwordTextField.placeholder = L10n.loginPasswordPlaceholder
        headerView.configureTexts(titleText: L10n.registrationTitle, subtitleText: L10n.registrationSubtitle)
        setupCheckBoxView()
        configureTextFields()
        actionButton.configureTitle(text: L10n.registrationButton)
        passwordTextField.isSecureTextEntry = true
        hideKeyboardWhenTappedAround()
    }
    
    private func configureTextFields() {
        Utilities.styleTextField(phoneTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    private func setupCheckBoxView() {
        let view = CheckBoxView.loadFromNib()
        view.setText(L10n.registrationPrivacyPolicy, part: "условиями сервиса и политикой конфидициальности")
        view.delegate = self
        stackView.addArrangedSubview(view)
    }
    
    private func showError(_ message: String) {
    // add alert show
    }
}

// MARK: - BottomActionButtonDelegate

extension RegisterViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let phoneNumber = phoneTextField.text, !phoneNumber.isEmpty else {
            showToast(message: "Fill all field")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showError("Error creating user")
            }
            else {
                let db = Firestore.firestore()
                db.collection("users").document(email).setData(["phoneNumber": phoneNumber,
                                                                "email": email,
                                                                "uid": result!.user.uid ]) { (error) in
                    if error != nil {
                        self.showError("Error saving user data")
                    }
                }
            }
        }
        if let phone = phoneTextField.text, !phone.isEmpty {
            let number = "+7\(phone)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] result in
                guard result else { return }
                DispatchQueue.main.async {
                    self?.navigationDelegate?.registerButtonDidTap()
                }
            }
        }
    }
}

//

extension RegisterViewController: CheckBoxViewDelegate {
    func checkBoxButtonDidTap(_ view: CheckBoxView, isSelected: Bool) {
        actionButton.buttonEnabled = isSelected
    }
    
    func linkDidTap(_ view: CheckBoxView, url: URL?) {}
}
