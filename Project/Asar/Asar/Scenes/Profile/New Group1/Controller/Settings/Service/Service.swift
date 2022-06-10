//
//  Service.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class Service: UIViewController {

    private let items: [CellConfigurator] = [
        FunctionCellConfigurator(item: "Соглашение"),
        FunctionCellConfigurator(item: "Общие положения"),
        FunctionCellConfigurator(item: "Регистрация Пользователя"),
        FunctionCellConfigurator(item: "Регистрация специалиста"),
        FunctionCellConfigurator(item: "Правила размещения"),
        FunctionCellConfigurator(item: "Персональные данные"),
        FunctionCellConfigurator(item: "Ответственность Пользователей"),
        FunctionCellConfigurator(item: "Права и обязанности"),
        FunctionCellConfigurator(item: "Сервис личных сообщений"),
        FunctionCellConfigurator(item: "Услуга компании")
    ]

    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
//        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tableDirector: TableDirector = {
          let tableDirector = TableDirector(tableView: tableView, items: items)
          return tableDirector
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        tableDirector.tableView.reloadData()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Service"
        setupLayouts()
        setUpActions()
    }
    private func setupLayouts(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setUpActions(){
        tableDirector.actionProxy.on(action: .didSelect) { [weak self] (configurator: FunctionCellConfigurator, cell) in
            guard let strongSelf = self else { return }
            print(configurator.item)
            if configurator.item == "Соглашение" {
                self?.navigationController?.pushViewController(AgreementPage(), animated: true)
            }
            else if configurator.item == "Общие положения" {
                self?.navigationController?.pushViewController(GeneralProvisionsPage(), animated: true)
            }
            else if configurator.item == "Регистрация Пользователя" {
                self?.navigationController?.pushViewController(UserRegistrationPage(), animated: true)
            }

            else if configurator.item == "Регистрация специалиста" {
                self?.navigationController?.pushViewController(SpecialistRegistrationPage(), animated: true)
            }

            else if configurator.item == "Правила размещения" {
                self?.navigationController?.pushViewController(PlacingRulesPage(), animated: true)
            }

            else if configurator.item == "Персональные данные" {
                self?.navigationController?.pushViewController(PersonalDataPage(), animated: true)
            }

            else if configurator.item == "Ответственность Пользователей" {
                self?.navigationController?.pushViewController(UsersResponsibilityPage(), animated: true)
            }

            else if configurator.item == "Права и обязанности" {
                self?.navigationController?.pushViewController(RightsAndObligationsPage(), animated: true)
            }
            
            else if configurator.item == "Сервис личных сообщений" {
                self?.navigationController?.pushViewController(MessagingServicePage(), animated: true)
            }
            
            else if configurator.item == "Услуга компании" {
                self?.navigationController?.pushViewController(CompanyServicePage(), animated: true)
            }

        }
    }
}
