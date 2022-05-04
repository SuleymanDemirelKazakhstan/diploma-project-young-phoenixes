//
//  HomeTitleCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

class HomeTitleCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configue(cellModel: HomeTitleCellModel) {
        titleLabel.text = cellModel.title
    }
}
