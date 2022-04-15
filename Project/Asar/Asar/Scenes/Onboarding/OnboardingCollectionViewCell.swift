//
//  OnboardingCollectionViewCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 15.04.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var subTitleCell: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ slide: OnboardingSlides){
        imageCell.image = slide.image
        titleCell.text = slide.title
        subTitleCell.text = slide.description
    }
}
