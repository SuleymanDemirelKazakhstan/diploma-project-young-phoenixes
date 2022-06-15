//
//  HomeBannerView.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 07.06.2022.
//

import UIKit

class HomeBannerView: UICollectionViewCell {

    @IBOutlet private var view: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
//    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func configure(with viewModel: HomeBannerModel){
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        imageView.image = viewModel.image
        view.backgroundColor = viewModel.backgroundColor
    }
}
