//
//  MyAddressTableViewCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 11.06.2022.
//

import UIKit

protocol MyAddressTableViewCellDelegate {
    func reloadTable()
}

class MyAddressTableViewCell: UITableViewCell {

    private var oldValue: Double = 0
    private var model: AddressBasket?
    var delegate: MyAddressTableViewCellDelegate?
    
    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
   private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        innerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.height.equalTo(56)
        }
        innerView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }

    func configure(model: AddressBasket?) {
        if let model = model {
            self.model = model
            oldValue = Double(model.count)
            addressLabel.text = model.address?.addressText
        }
    }

    
}
