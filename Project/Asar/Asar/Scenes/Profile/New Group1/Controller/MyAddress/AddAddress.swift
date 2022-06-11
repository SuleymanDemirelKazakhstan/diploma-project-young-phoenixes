//
//  AddAddress.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 11.06.2022.
//

import UIKit

class AddAddress: UIViewController {

    private var oldValue: Double = 0
    private var model: Address?
    
    private let addressView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let currentAddress: UITextField = {
          let textField = UITextField()
            textField.placeholder = "Адрес"
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private let entranceView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let currentEntrance: UITextField = {
          let textField = UITextField()
            textField.placeholder = "Подъезд"
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    
    private let flatView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let currentFlat: UITextField = {
          let textField = UITextField()
            textField.placeholder = "Номер квартиры"
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private let floorView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
     }()
    
    private let currentFloor: UITextField = {
          let textField = UITextField()
            textField.placeholder = "Номер этажа"
            textField.backgroundColor = UIColor.white
          return textField
      }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [flatView, floorView])
         stackView.axis = .horizontal
         stackView.spacing = 8
         return stackView
     }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить адрес", for: .normal)
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
    }
    
    @objc private func touchBtn(){
  
    }
    
    private func setupLayouts(){
        view.addSubview(addressView)
        addressView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        addressView.addSubview(currentAddress)
        currentAddress.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        view.addSubview(entranceView)
        entranceView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(addressView.snp.bottom).offset(16)
        }
        entranceView.addSubview(currentEntrance)
        currentEntrance.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        flatView.addSubview(currentFlat)
        currentFlat.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        floorView.addSubview(currentFloor)
        currentFloor.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(72)
            $0.top.equalTo(entranceView.snp.bottom).offset(16)
        }
        
        view.addSubview(addBtn)
        addBtn.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.right.left.equalToSuperview().inset(16)
        }
    }
    
//    func configure(with items: Address){
//        currentAddress.text = items.addressText
//    }
}
