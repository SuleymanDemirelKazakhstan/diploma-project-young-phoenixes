//
//  ProfileViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit
import SnapKit
import Firebase

class ProfileViewController: UIViewController {
    
    private let items: [CellConfigurator] = [
        FunctionCellConfigurator(item: L10n.profileUserProfile),
        FunctionCellConfigurator(item: L10n.profileBankInfo),
        FunctionCellConfigurator(item: L10n.profileAddress),
        FunctionCellConfigurator(item: L10n.profileSettings),
        FunctionCellConfigurator(item: L10n.profileSupport),
        FunctionCellConfigurator(item: L10n.profileExit)
    ]
    
    private let topView: UIView = {
        let topView = UIView()
        return topView
    }()
    
    private let photoView: UIImageView = {
        let photoView = UIImageView(image: UIImage(named: "ava")!)
        photoView.clipsToBounds = true
        photoView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        photoView.contentMode = .scaleAspectFill
        return photoView
    }()
    private let imageBottomTitle: UILabel = {
        let imageBottomTitle = UILabel()
        imageBottomTitle.font = .systemFont(ofSize: 18, weight: .bold)
        return imageBottomTitle
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tableDirector: TableDirector = {
          let tableDirector = TableDirector(tableView: tableView, items: items)
          return tableDirector
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        tableDirector.tableView.reloadData()
        rightBarItem()
        setupLayouts()
        setUpActions()
        updateUI()
    }
    
    private func setupLayouts(){
        view.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        topView.addSubview(photoView)
        photoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
            $0.width.equalTo(photoView.snp.height)
            
        }
        
        topView.addSubview(imageBottomTitle)
        imageBottomTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(photoView.snp.bottom).offset(16)
            $0.height.equalTo(26)

        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    
    }
    
    private func rightBarItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "shape"),
            style: .done,
            target: self,
            action: #selector(didTapShape))
    }
    
    @objc private func didTapShape(){
        
    }
    
    private func updateUI() {
       guard let user = Auth.auth().currentUser else { return }
        imageBottomTitle.text = user.email
     }
    
//    private func setUpActions(){
//           tableDirector.actionProxy.on(action: .didSelect) { [weak self] (configurator: FunctionCellConfigurator, cell) in
//               guard let strongSelf = self else { return }
//               print(configurator.item)
//               if configurator.item == "Личная информация" {
//                   self?.navigationController?.pushViewController(ProfileInformationViewController(), animated: true)
//               }
//               else if configurator.item == "Банковские данные" {
//                   self?.navigationController?.pushViewController(ProfileInformationViewController(), animated: true)
//               }
//           }
//       }
    
    private func setUpActions(){
        tableDirector.actionProxy.on(action: .didSelect) { [weak self] (configurator: FunctionCellConfigurator, cell) in
            guard let strongSelf = self else { return }
            print(configurator.item)
            if configurator.item == L10n.profileUserProfile {
                self?.navigationController?.pushViewController(ProfileInformationViewController(), animated: true)
            }
            else if configurator.item == L10n.profileBankInfo {
                self?.navigationController?.pushViewController(BankInformationViewController(), animated: true)
            }
            else if configurator.item == L10n.profileAddress {
                self?.navigationController?.pushViewController(MyAddressViewController(), animated: true)
            }
            else if configurator.item == L10n.profileSettings {
                self?.navigationController?.pushViewController(SettingsAppViewController(), animated: true)
            }
            else if configurator.item == L10n.profileSupport {
                self?.navigationController?.pushViewController(SupportViewController(), animated: true)
            }
            else if configurator.item == L10n.profileExit {
                do{
                    try Auth.auth().signOut()
                    self?.dismiss(animated: true, completion: nil)
                }catch{
                    print("error message")
                    }
            }
        }
    }
}
