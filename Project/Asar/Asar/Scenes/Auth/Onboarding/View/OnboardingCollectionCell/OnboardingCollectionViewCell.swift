//
//  OnboardingCollectionViewCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 15.04.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageCell: UIImageView!
    @IBOutlet private var titleCell: UILabel!
    @IBOutlet private var subtitleCell: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ slide: OnboardingSlides){
        imageCell.image = slide.image
        titleCell.text = slide.title
        subtitleCell.text = slide.description
    }
}
