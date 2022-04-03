//
//  ServiceCollectionViewCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 04.04.2022.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    static let identifier = "ServiceCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "service"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = contentView.frame
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
}
