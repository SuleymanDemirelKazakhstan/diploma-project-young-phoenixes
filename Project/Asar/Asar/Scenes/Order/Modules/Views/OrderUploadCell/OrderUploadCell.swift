//
//  OrderUploadCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 12.06.2022.
//

import UIKit

class OrderUploadCell: UITableViewCell {
    @IBOutlet private var view: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconButton: UIButton!
    @IBOutlet private var textButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        view.layer.cornerRadius = 10
        titleLabel.text = "Дополнительная информация"
        iconButton.setImage(Asset.upload.image, for: .normal)
        iconButton.tintColor = UIColor(red: 0.141, green: 0.431, blue: 0.914, alpha: 1)
        textButton.setTitle("Загрузить фото или видео", for: .normal)
        textButton.setTitleColor(UIColor(red: 0.141, green: 0.431, blue: 0.914, alpha: 1), for: .normal)
    }
}
