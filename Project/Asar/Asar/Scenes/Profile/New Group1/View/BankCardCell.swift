//
//  BankCardCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 14.06.2022.
//

import UIKit

class BankCardCell: UITableViewCell {

    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    

   private let numberCard: UILabel = {
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
        contentView.addSubview(innerView)
        innerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.height.equalTo(56)
        }
        innerView.addSubview(numberCard)
        numberCard.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }

    func configure(model: BankCard?) {
        if let model = model {
            numberCard.text = model.nameCard
        }
    }

}
