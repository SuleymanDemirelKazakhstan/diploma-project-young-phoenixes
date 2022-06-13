//
//  FAQpage.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit
import SnapKit

class FAQpage: UIViewController {
    
    let questionIdentifier = "QuestionCell"
    let answerIdentifier = "AnswerCell"
    let questionRow = 0
    let answerRow = 1
    
    var faqs: [FAQ] = [
        FAQ(question: "Как пользоваться приложением ASAR?", answer: "Кнопка, которая доходит до краев экрана, может не выглядеть как кнопка. Соблюдайте стандартные системные поля по бокам полноразмерных кнопок."),
        FAQ(question: "Как выбрать хорошего специалиста?", answer: "Кнопка, которая доходит до краев экрана, может не выглядеть как кнопка. Соблюдайте стандартные системные поля по бокам полноразмерных кнопок."),
        FAQ(question: "Как заказать услуги?", answer: "Кнопка, которая доходит до краев экрана, может не выглядеть как кнопка. Соблюдайте стандартные системные поля по бокам полноразмерных кнопок."),
        FAQ(question: "Как предостеречь себя от мошенничества?", answer: "Кнопка, которая доходит до краев экрана, может не выглядеть как кнопка. Соблюдайте стандартные системные поля по бокам полноразмерных кнопок."),
        FAQ(question: "Как выбрать хорошего специалиста?", answer: "Кнопка, которая доходит до краев экрана, может не выглядеть как кнопка. Соблюдайте стандартные системные поля по бокам полноразмерных кнопок.")
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(QuestionCell.self, forCellReuseIdentifier: questionIdentifier)
        tableView.register(AnswerCell.self, forCellReuseIdentifier: answerIdentifier)
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FAQ"
        view.backgroundColor = .systemGray6
        setUp()
    }
    
    private func setUp(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func closeAllAnswers(exceptFor exceptionSectionindex: Int) {
        // Loop through all of the FAQ
        for sectionIndex in  0..<self.faqs.count {

            // if the section is not the section that was Selected
            if sectionIndex != exceptionSectionindex {

                // if the FAQ is Open, close it
                if self.faqs[sectionIndex].isOpen {
                    let qIndexPath = IndexPath(row: questionRow, section: sectionIndex)
                    let aIndexPath = IndexPath(row: answerRow, section: sectionIndex)
                    guard let qCell = tableView.cellForRow(at: qIndexPath) as? QuestionCell else { return }
                    self.faqs[sectionIndex].isOpen.toggle()
                    tableView.deleteRows(at: [aIndexPath], with: .fade)
                    qCell.animateChevron()
                    return // We return here because there should only be 1 Answer open at a time
                }
            }
        }
    }
}

extension FAQpage: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return faqs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let openRowCount = 2
        let closedRowCount = 1
        return faqs[section].isOpen ? openRowCount : closedRowCount
    }
}

extension FAQpage: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == questionRow {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: questionIdentifier) as? QuestionCell else {
                return UITableViewCell()
            }
            
            cell.questionLabel.text = faqs[indexPath.section].question
            
            return cell
        }
        
        else if indexPath.row == answerRow {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: answerIdentifier) as? AnswerCell else {
                return UITableViewCell()
            }
            
            cell.answerLabel.text = faqs[indexPath.section].answer
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == questionRow {
            guard let cell = tableView.cellForRow(at: indexPath) as? QuestionCell else { return }
            let answerIndexPath = IndexPath(row: answerRow,
                                            section: indexPath.section)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.faqs[indexPath.section].isOpen.toggle()
                if self.faqs[indexPath.section].isOpen {
                    tableView.insertRows(at: [answerIndexPath], with: .fade)
                } else {
                    tableView.deleteRows(at: [answerIndexPath], with: .fade)
                }
                cell.animateChevron()

                self.closeAllAnswers(exceptFor: indexPath.section)
            }
        }
    }
    
    
}
