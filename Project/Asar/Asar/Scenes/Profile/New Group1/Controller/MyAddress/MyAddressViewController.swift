//
//  MyAddressViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit
import SnapKit

class MyAddressViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyAddressTableViewCell.self, forCellReuseIdentifier: MyAddressTableViewCell.cellIdentifier())
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
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
        navigationItem.title = "My Addresses"
        view.backgroundColor = .systemGray6
        setupLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         
//         UIView.transition(
//            with: self.view, duration: 0.25,
//            options: .transitionCrossDissolve,
//            animations: { [self] in
////                AddressList.shared.basketList.count > 0
//            tableView.reloadData()
//         },
//        completion: nil)
     }
    
    private func setupLayouts(){
        view.addSubview(addBtn)
        addBtn.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.right.left.equalToSuperview().inset(16)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.bottom.equalTo(addBtn.snp.top)
        }
    }
    
    @objc private func touchBtn(){
        let vc = AddAddress()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

//  MARK: - TABLEVIEW DELEGATE
extension MyAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddressList.shared.basketList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyAddressTableViewCell.cellIdentifier(), for: indexPath) as! MyAddressTableViewCell
        cell.configure(model: AddressList.shared.basketList[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - TALBE VIEW CELL EXTENSION
extension UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

// MARK: - ORDER TABLE VIEW CELL DELEGATE
extension MyAddressViewController: MyAddressTableViewCellDelegate {
    func reloadTable() {
//        UIView.transition(
//            with: self.view,
//                          duration: 0.25,
//                          options: .transitionCrossDissolve,
//                          animations: { [self] in
//            tableView.reloadData()
//        },
//                          completion: nil)
//    }
    }
    
}
