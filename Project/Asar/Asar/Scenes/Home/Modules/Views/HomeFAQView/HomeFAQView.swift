//
//  HomeFAQView.swift
//  Asar
//
//  Created by Abylbek Khassenov on 06.06.2022.
//

import UIKit

class HomeFAQView: UIView, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func configure(viewModel: HomeFAQCellModel) {
        titleLabel.text = viewModel.title
    }
    
    private func setup() {
        iconImageView.setImage(Asset.faqdown.image, for: .normal)
        iconImageView.tintColor = .black
        self.layer.cornerRadius = 10
    }
}
