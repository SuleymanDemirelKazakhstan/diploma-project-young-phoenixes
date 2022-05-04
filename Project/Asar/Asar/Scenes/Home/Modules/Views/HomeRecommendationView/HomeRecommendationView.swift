//
//  HomeRecommendationView.swift
//  Asar
//
//  Created by Abylbek Khassenov on 04.05.2022.
//

import UIKit

class HomeRecommendationView: UIView, NibLoadable {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func configure(viewModel: HomeRecommendationViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        nameLabel.text = viewModel.name
        detailLabel.text = viewModel.detail
        priceLabel.text = viewModel.price
    }
    
    private func setup() {
        layer.cornerRadius = 10
    }
}
