//
//  LoginViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

protocol LoginViewControllerDelegate {
    func loginDidTap()
    func forgetPasswordDidTap()
    func registerDidTap()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var forget_btn: UIButton!
    @IBOutlet weak var register_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let login = NSLocalizedString("log_in", comment: "")
        login_btn.setTitle(login, for: .normal)
        let forgetBtn = NSLocalizedString("forget_password", comment: "")
        forget_btn.setTitle(forgetBtn, for: .normal)
        let register = NSLocalizedString("register", comment: "")
        register_btn.setTitle(register, for: .normal)
    }
    
    @IBAction private func loginDidTap() {
    }
    
    @IBAction func forgetPasswordDidTap() {
    }
    
    @IBAction func registerDidTap() {
    }
}
