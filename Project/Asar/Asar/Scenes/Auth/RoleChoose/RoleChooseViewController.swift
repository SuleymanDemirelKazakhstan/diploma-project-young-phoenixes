//
//  RoleChooseViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 16.06.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

protocol RoleChooseViewDelegate: AnyObject {
    func showMainPage(viewState: ViewState)
}

class RoleChooseViewController: UIViewController {
    private weak var navigationDelegate: RoleChooseViewDelegate?
    private var db = Firestore.firestore()
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var clientView: UIView!
    @IBOutlet private var clentButton: UIButton!
    @IBOutlet private var clientTitle: UILabel!
    @IBOutlet private var specView: UIView!
    @IBOutlet private var specButton: UIButton!
    @IBOutlet private var specTitle: UILabel!
    
    @IBAction func clientButtonDidTap(_ sender: UIButton) {
        navigationDelegate?.showMainPage(viewState: .client)
        showToast(message: "Регистрация пройдена успешно")
    }
    
    @IBAction func specButtonDidTap(_ sender: UIButton) {
        navigationDelegate?.showMainPage(viewState: .specialist)
        showToast(message: "Регистрация пройдена успешно")
    }
    
    init(navigationDelegate: RoleChooseViewDelegate) {
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
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        titleLabel.text = "Выберите роль"
        subtitleLabel.text = "Чтобы закончить регистрацую, нужно выбрать роль"
        clientView.layer.cornerRadius = 16
        clientView.backgroundColor = .white
        clentButton.setImage(Asset.client.image, for: .normal)
        clientTitle.text = "Ищу специалиста"
        specView.layer.cornerRadius = 16
        specView.backgroundColor = .white
        specButton.setImage(Asset.spec.image, for: .normal)
        specTitle.text = "Ищу работу"
    }
}
