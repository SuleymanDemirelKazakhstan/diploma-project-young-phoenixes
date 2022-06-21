//
//  BottomActionButton.swift
//  Asar
//
//  Created by Abylbek Khassenov on 28.04.2022.
//

import UIKit

protocol BottomActionButtonDelegate: AnyObject {
    func actionButtonDidTap()
}

class BottomActionButton: UIView, NibOwnerLoadable {
    weak var delegate: BottomActionButtonDelegate?
    @IBOutlet weak var actionButton: UIButton!
    var buttonEnabled: Bool? {
        didSet {
            buttonStateChanged()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        loadNibContent()
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = .blue
    }
    
    private func buttonStateChanged() {
        actionButton.isEnabled = buttonEnabled ?? false
        actionButton.backgroundColor = (buttonEnabled ?? false) ? .blue : .lightGray
    }
    
    func configureTitle(text: String) {
        actionButton.setTitle(text, for: .normal)
        actionButton.setTitle(text, for: .disabled)
    }
    
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        delegate?.actionButtonDidTap()
    }
}
