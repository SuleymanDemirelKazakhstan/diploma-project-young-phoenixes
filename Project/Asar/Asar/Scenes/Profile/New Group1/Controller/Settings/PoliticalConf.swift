//
//  PoliticalConf.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class PoliticalConf: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.isScrollEnabled = false
        return tableView
    }()
//
//    private lazy var tableDirector: TableDirector = {
//          let tableDirector = TableDirector(tableView: tableView, items: items)
//          return tableDirector
//      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableDirector.tableView.reloadData()
        view.backgroundColor = .systemGray6
        // Do any additional setup after loading the view.
    }
}
