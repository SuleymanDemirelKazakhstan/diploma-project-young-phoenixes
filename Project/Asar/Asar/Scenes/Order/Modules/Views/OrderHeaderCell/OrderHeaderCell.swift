//
//  OrderHeaderCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 12.06.2022.
//

import UIKit

class OrderHeaderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Создать заявку"
    }
}
