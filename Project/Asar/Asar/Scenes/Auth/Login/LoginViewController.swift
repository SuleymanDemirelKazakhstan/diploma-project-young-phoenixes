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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func loginDidTap() {
    }
    
    @IBAction func forgetPasswordDidTap() {
    }
    
    @IBAction func registerDidTap() {
    }
}
