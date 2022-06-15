//
//  SupportViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class SupportViewController: UIViewController {

    private let items: [CellConfigurator] = [
        FunctionCellConfigurator(item: "FAQ"),
        FunctionCellConfigurator(item: "Написать тех.поддержке")
    ]
    
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
        tableDirector.tableView.reloadData()
        view.backgroundColor = .systemGray6
        navigationItem.title = L10n.profileSupport
        setupLayouts()
        setUpActions()
        // Do any additional setup after loading the view.
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
            if configurator.item == "FAQ" {
                self?.navigationController?.pushViewController(FAQpage(), animated: true)
            }
            else if configurator.item == "Условия сервиса" {
                self?.navigationController?.pushViewController(ChatSupport(), animated: true)
            }
        }
    }

}
