//
//  RegisterConfirmViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 18.04.2022.
//

import UIKit

protocol RegisterConfirmNavigationDelegate: AnyObject {
    func confirmDidTap()
}

class RegisterConfirmViewController: UIViewController {
    private weak var navigationDelegate: RegisterConfirmNavigationDelegate?
    @IBOutlet private var headerView: HeaderView!
    @IBOutlet private var codeTextField: SMSCodeTextField!
    @IBOutlet private var actionButton: BottomActionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.delegate = self
        setupUI()
        codeTextField.configure()
    }
    
    init(navigationDelegate: RegisterConfirmNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        headerView.configureTexts(titleText: L10n.registrationTitle, subtitleText: L10n.registrationSubtitle)
        actionButton.configureTitle(text: L10n.loginMakeRegistrationButton)
        hideKeyboardWhenTappedAround()
        
    }
}

extension RegisterConfirmViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        if let code = codeTextField.text, !code.isEmpty {
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] result in
                guard result else {
                    self?.presentAlert(title: "Неправильный код")
                    return
                }
                DispatchQueue.main.async {
                    self?.navigationDelegate?.confirmDidTap()
                }
            }
        }
    }
}
