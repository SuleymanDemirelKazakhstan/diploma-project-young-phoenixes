//
//  SectionHeaderView.swift
//  Asar
//
//  Created by Abylbek Khassenov on 06.06.2022.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        setup()
    }
    
    func configure(with viewModel: ActionSectionHeaderViewModelProtocol) {
        titleLabel.text = viewModel.title
    }
    
    private func setup() {
        actionButton.setImage(Asset.headerIcon.image, for: .normal)
        actionButton.tintColor = .black
    }
}
