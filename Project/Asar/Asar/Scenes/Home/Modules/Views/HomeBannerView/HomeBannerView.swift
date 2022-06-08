//
//  HomeBannerView.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 07.06.2022.
//

import UIKit

class HomeBannerView: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with viewModel: HomeBannerModel){
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        imageView.image = viewModel.image
    }
}
