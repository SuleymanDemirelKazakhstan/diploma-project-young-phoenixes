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
    func loginDidTap(viewState: ViewState)
    func forgetPasswordDidTap()
}

class LoginViewController: UIViewController {
    private weak var navigationDelegate: LoginViewControllerDelegate?
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var actionView: BottomActionButton!
    @IBOutlet private var bottomTittle: UILabel!
    @IBOutlet private var bottomButton: UIButton!
    private var viewState: ViewState?
    private var db = Firestore.firestore()
    
    @IBAction func bottomButtonDidTap(_ sender: UIButton) {
        navigationDelegate?.forgetPasswordDidTap()
    }
    
    init(navigationDelegate: LoginViewControllerDelegate, viewState: ViewState?) {
        self.navigationDelegate = navigationDelegate
        self.viewState = viewState
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
        self.navigationController?.isNavigationBarHidden = true
        headerView.configureTexts(titleText: L10n.loginTitle, subtitleText: L10n.loginSubtitle)
        actionView.delegate = self
        actionView.configureTitle(text: L10n.loginLogInButton)
        Utilities.styleTextField(emailTextField)
        emailTextField.placeholder = L10n.loginMailPlaceholder
        Utilities.styleTextField(passwordTextField)
        passwordTextField.placeholder = L10n.loginPasswordPlaceholder
        passwordTextField.isSecureTextEntry = true
        bottomTittle.text = L10n.loginDontHaveAccTitle
        bottomButton.setTitle(L10n.loginMakeRegistrationButton
                              , for: .normal)
    }
    
    private func actionButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showToast(message: "Заполните все поля")
            return
        }
        if let viewState = viewState {
            db.collection("users").document(email).setData(["viewState": "\(viewState)"], merge: true)
        }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error!)
            }
            else {
                self.db.collection("users").document(email).getDocument() { document, err in
                    if let err = err {
                        print(err)
                    } else {
                        self.viewState = (document?["viewState"] as? String) == "client" ? .client : .specialist
                    }
                }
                print(self.viewState)
                self.navigationDelegate?.loginDidTap(viewState: self.viewState ?? .client)
            }
        }
    }
}

extension LoginViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        actionButtonTapped()
    }
}
