//
//  BankInformationViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class BankInformationViewController: UIViewController {

    private var listOfCard: [BankCard] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BankCardCell.self, forCellReuseIdentifier: BankCardCell.cellIdentifier())
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить карту", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Bank Information"
        view.backgroundColor = .systemGray6
        setupLayouts()
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
        let vc = AddBankCard()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension BankInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCard.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BankCardCell.cellIdentifier(), for: indexPath) as! BankCardCell
        cell.configure(model: listOfCard[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .systemGray6
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - TALBE VIEW CELL EXTENSION
//extension UITableViewCell {
//    static func cellIdentifier() -> String {
//        return String(describing: self)
//    }
//}

// MARK: - ORDER TABLE VIEW CELL DELEGATE
extension BankInformationViewController: AddBankCardTableViewCellDelegate {
    func reloadTable(with: BankCard?) {
        if let bankCard = with {
            UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve, animations: { [self] in
                listOfCard.append(bankCard)
                tableView.reloadData()
            }, completion: nil)
        }
    }
}

