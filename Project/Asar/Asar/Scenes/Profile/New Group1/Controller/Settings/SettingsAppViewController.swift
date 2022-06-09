//
//  SettingsAppViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit
import SnapKit

class SettingsAppViewController: UIViewController {

    private let items: [CellConfigurator] = [
        SettingCellConfigurator(item: "Данные о местоположении"),
        SettingCellConfigurator(item: "Push-уведомления"),
        SettingCellConfigurator(item: "Данные о фотографии"),
        SettingCellConfigurator(item: "Разрешение к сообщению"),
        FunctionCellConfigurator(item: "Политика конфиденциальности"),
        FunctionCellConfigurator(item: "Условия сервиса"),
        FunctionCellConfigurator(item: "О приложении")
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private lazy var tableDirector: TableDirector = {
          let tableDirector = TableDirector(tableView: tableView, items: items)
          return tableDirector
      }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDirector.tableView.reloadData()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Settings"
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
            if configurator.item == "Политика конфиденциальности" {
                self?.navigationController?.pushViewController(PoliticalConf(), animated: true)
            }
            else if configurator.item == "Условия сервиса" {
                self?.navigationController?.pushViewController(Service(), animated: true)
            }
        }
    }
}
