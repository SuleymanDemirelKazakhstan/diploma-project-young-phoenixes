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
        .init(title: L10n.mainFAQfirstQuestion, text: L10n.mainFAQfirstAnswer),
        .init(title: L10n.mainFAQsecondQuestion, text: L10n.mainFAQsecondAnswer),
        .init(title: L10n.mainFAQthirdQuestion, text: L10n.mainFAQthirdAnswer),
        .init(title: L10n.mainFAQfourthQuestion, text: L10n.mainFAQfourthAnswer),
        .init(title: L10n.mainFAQfifthQuestion, text: L10n.mainFAQfifthAnswer)]
    
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
