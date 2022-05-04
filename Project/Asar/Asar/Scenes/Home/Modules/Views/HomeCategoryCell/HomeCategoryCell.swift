//
//  CollectionViewCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func configure(with viewModel: HomeCategoryViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.name
    }

    private func setup() {
        layer.cornerRadius = 10
        iconView.layer.cornerRadius = 8
    }
}
