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
        headerView.configureTexts(titleText: "Регистрация", subtitleText: "Введите номер телефона, чтобы начать регистрацию")
        setupCheckBoxView()
        Utilities.styleTextField(phoneTextField)
        actionButton.configureTitle(text: "Зарегистрироваться")
        
    }
    
    private func setupCheckBoxView() {
        let view = CheckBoxView.loadFromNib()
        view.setText("Я соглашаюсь с условиями сервиса и политикой конфидициальности", part: "условиями сервиса и политикой конфидициальности")
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
    }
}
