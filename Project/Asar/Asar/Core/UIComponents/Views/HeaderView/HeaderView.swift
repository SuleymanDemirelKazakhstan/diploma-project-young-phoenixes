//
//  HeaderView.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.04.2022.
//

import UIKit

class HeaderView: UIView, NibOwnerLoadable {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
    }
    
    func configureTexts(titleText: String, subtitleText: String) {
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
}
