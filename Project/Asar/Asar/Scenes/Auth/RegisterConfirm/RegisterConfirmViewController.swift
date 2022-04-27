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
    @IBOutlet private var codeTextField: UITextField!
    @IBOutlet private var detailLabel: UILabel!
    @IBOutlet private var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(navigationDelegate: RegisterConfirmNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        headerView.configureTexts(titleText: "Подтверждение", subtitleText: "Введите код авторизации, полученный по SMS на номер")
        confirmButton.layer.cornerRadius = 10
    }
    
    @IBAction func confirmDidTap(_ sender: Any) {
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
