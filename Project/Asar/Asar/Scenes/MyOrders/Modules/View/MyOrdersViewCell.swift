//
//  MyOrdersViewCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.06.2022.
//

import UIKit

class MyOrdersViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var iconimageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configure(order: Order) {
        userImageView.image = Asset.user.image
        iconimageView.image = Asset.user.image
        categoryLabel.text = order.category
        nameLabel.text = order.name
        priceLabel.text = order.price
        timeLabel.text = order.date
    }
    
    private func setupUI() {
        view.layer.cornerRadius = 10
        categoryLabel.textColor = .black
        userImageView.tintColor = .lightGray
        iconimageView.tintColor = .lightGray
        nameLabel.textColor = .lightGray
        priceLabel.textColor = .black
        timeLabel.textColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
