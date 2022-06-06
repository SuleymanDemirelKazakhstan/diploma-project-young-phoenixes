//
//  HomeFAQCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 06.06.2022.
//

import UIKit

class HomeFAQCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    private var homeFAQ: [HomeFAQCellModel] = [
        .init(title: "Как выбрать хорошего специалиста?", text: ""),
        .init(title: "Как заказать услуги?", text: ""),
        .init(title: "Как предостеречь себя от мошенничества?", text: ""),
        .init(title: "Как предостеречь себя от мошенничества?", text: ""),
        .init(title: "Как выбрать хорошего специалиста?", text: "")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        homeFAQ.forEach {
            let view = HomeFAQView.loadFromNib()
            view.configure(viewModel: $0)
            stackView.addArrangedSubview(view)
        }
    }
}
