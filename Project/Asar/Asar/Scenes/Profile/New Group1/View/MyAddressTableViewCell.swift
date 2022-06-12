//
//  MyAddressTableViewCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 11.06.2022.
//

import UIKit

class MyAddressTableViewCell: UITableViewCell {
    
    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
    private let imageLocation: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
   private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [imageLocation, addressLabel])
         stackView.axis = .horizontal
         stackView.spacing = 16
         return stackView
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func imageUI(){
        
        setupViews()
        
        imageLocation.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(12)
            
        }
    }
    
    private func setupViews(){
        contentView.addSubview(innerView)
        innerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.height.equalTo(56)
        }
        innerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }

    func configure(model: Address?) {
        if let model = model {
            addressLabel.text = model.addressText
        }
    }
}
