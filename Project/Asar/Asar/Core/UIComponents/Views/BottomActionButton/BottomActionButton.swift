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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        loadNibContent()
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = .blue
    }
    
    func configureTitle(text: String) {
        actionButton.setTitle(text, for: .normal)
    }
    
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        delegate?.actionButtonDidTap()
    }
}
