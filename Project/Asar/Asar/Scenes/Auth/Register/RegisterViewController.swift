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
    @IBOutlet weak var phoneTextField: UITextField!
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
        Utilities.styleTextField(phoneTextField)
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
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

    private func showError(_ message: String) {
    // add alert show
    }
}
