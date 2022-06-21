//
//  AddBankCard.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 14.06.2022.
//

import UIKit

protocol AddBankCardTableViewCellDelegate {
    func reloadTable(with: BankCard?)
}

class AddBankCard: UIViewController {

    private var model: BankCard?
    var delegate: AddBankCardTableViewCellDelegate?
    
    private let nameView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let nameCard: UITextField = {
          let textField = UITextField()
        textField.placeholder = L10n.profileNamePlaceholder
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private let numberView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let numberCard: UITextField = {
          let textField = UITextField()
        textField.placeholder = L10n.profileNumberCardPlaceholder
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    
    private let expiryView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let expiryDate: UITextField = {
          let textField = UITextField()
        textField.placeholder = L10n.profileExpiryDatePlaceholder
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private let cvvView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let cvvNumber: UITextField = {
          let textField = UITextField()
        textField.placeholder = L10n.profileCVVPlaceholder
            textField.isSecureTextEntry = true
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [expiryView, cvvView])
         stackView.axis = .horizontal
         stackView.spacing = 8
         return stackView
     }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.profileAddBankCard, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupLayouts()
        hideKeyboardWhenTappedAround()
    }
    

    @objc private func touchBtn(){
        let bankCard = BankCard(nameCard:nameCard.text )
        delegate?.reloadTable(with: bankCard)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupLayouts(){
        view.addSubview(nameView)
        nameView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        nameView.addSubview(nameCard)
        nameCard.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        view.addSubview(numberView)
        numberView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(nameView.snp.bottom).offset(16)
        }
        numberView.addSubview(numberCard)
        numberCard.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }

        expiryView.addSubview(expiryDate)
        expiryDate.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }

        cvvView.addSubview(cvvNumber)
        cvvNumber.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }

        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(numberView.snp.bottom).offset(16)
        }
        
        view.addSubview(addBtn)
        addBtn.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.right.left.equalToSuperview().inset(16)
        }
    }

}



