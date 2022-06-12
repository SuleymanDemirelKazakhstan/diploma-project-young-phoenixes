//
//  AgreementPage.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class AgreementPage: UIViewController {

    private let items: [CellConfigurator] = [
        PoliticalConfCellConfigurator(item: PoliticalConfModel(
            conflabel: "Соглашение об использовании интернет-ресурса ASAR (далее по тексту — «Соглашение»)",
            firstlabel: "Настоящая Политика конфиденциальности применяется ко всем Пользователям Интернет-ресурсов и Сервисов Компании.",
            secondlabel: "Пользователи прямо соглашаются на обработку своих персональных данных, как это описано в настоящей Политике. Обработка означает любую операцию с персональными данными независимо от используемых средств и процедуры, в частности сбор, запись, систематизацию, накопление, хранение, уточнение, обновление, изменение и извлечение персональных данных, а также их использование, передачу, распространение, предоставление, доступ, обезличивание, блокирование, удаление и уничтожение.",
            thirdlabel: " Компания является контролером данных, отвечает за цели обработки персональных данных Пользователей и может передавать персональные данные или поручать их обработку любой третьей стороне, в том числе зарубежным компаниям-партнерам по аналитике и коммуникационным системам (чат с Пользователем), в порядке предусмотренном законодательством."))
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
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
        setupLayouts()
    }
    
    private func setupLayouts(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
 
    
}

