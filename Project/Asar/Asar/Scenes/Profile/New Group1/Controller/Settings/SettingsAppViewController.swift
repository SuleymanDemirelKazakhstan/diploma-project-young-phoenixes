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
        SettingCellConfigurator(item: L10n.settingLocationData),
        SettingCellConfigurator(item: L10n.settingPush),
        SettingCellConfigurator(item: L10n.settingPhotoData),
        SettingCellConfigurator(item: L10n.settingAccessMessage),
        FunctionCellConfigurator(item: L10n.settingPolitacalConf),
        FunctionCellConfigurator(item: L10n.settingService),
        FunctionCellConfigurator(item: L10n.settingAboutApp)
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
        navigationItem.title = L10n.profileSettings
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
            if configurator.item == L10n.settingPolitacalConf {
                self?.navigationController?.pushViewController(PoliticalConf(), animated: true)
            }
            else if configurator.item == L10n.settingService {
                self?.navigationController?.pushViewController(Service(), animated: true)
            }
            else if configurator.item == L10n.settingAboutApp {
                self?.navigationController?.pushViewController(AboutUs(), animated: true)
            }
        }
    }
}
