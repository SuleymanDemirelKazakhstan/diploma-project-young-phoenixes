//
//  OrderFieldCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 12.06.2022.
//

import UIKit

protocol OrderFieldCellDelegate: AnyObject {
    func rightViewButtonDidTap(_ textField: OrderFieldCell, row: OrderRow)
    func textFieldDidChange(_ textField: OrderFieldCell, text: String, row: OrderRow)
}

class OrderFieldCell: UITableViewCell {
    weak var actionDelegate: OrderFieldCellDelegate?
    private var row: OrderRow?
    
    @IBOutlet private var view: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet private var descriptionLabel: UILabel!
    
    private lazy var rightViewButton: UIButton = {
        let button = UIButton()
        button.frame.size = .init(width: 24, height: 24)
        button.addTarget(self, action: #selector(rightViewButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configure(cellModel: OrderFieldCellModel, row: OrderRow) {
        self.row = row
        textField.text = cellModel.text
        textField.rightViewMode = cellModel.rightViewMode
        textField.placeholder = cellModel.placeholder
        if cellModel.description != nil {
            descriptionLabel.text = cellModel.description
        } else {
            descriptionLabel.isHidden = true
        }
        if cellModel.rightViewMode == .always {
            if cellModel.rightViewText == nil {
                rightViewButton.setImage(Asset.faqdown.image, for: .normal)
                rightViewButton.tintColor = .lightGray
            } else {
                rightViewButton.setTitle(cellModel.rightViewText, for: .normal)
                rightViewButton.setTitleColor(UIColor(red: 1, green: 0.584, blue: 0, alpha: 1), for: .normal)
            }
            rightViewButton.addTarget(self, action: #selector(rightViewButtonDidTap), for: .touchUpInside)
            textField.rightView = rightViewButton
        }
    }
    
    private func setupUI() {
        textField.delegate = self
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        descriptionLabel.textColor = UIColor(red: 0.567, green: 0.567, blue: 0.567, alpha: 1)
        descriptionLabel.lineBreakMode = .byWordWrapping
        Utilities.styleTextField(textField)
    }
    
    @objc
    private func rightViewButtonDidTap() {
        actionDelegate?.rightViewButtonDidTap(self, row: row ?? .header)
    }
}

extension OrderFieldCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        actionDelegate?.textFieldDidChange(self, text: textField.text ?? "", row: row ?? .header)
    }
}
