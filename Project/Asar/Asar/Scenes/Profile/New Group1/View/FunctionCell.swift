//
//  ImageCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 09.06.2022.
//

import UIKit

typealias FunctionCellConfigurator = TableCellConfigurator<FunctionCell, String>

class FunctionCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = String
    
    
    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
   private let functionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let imageRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "headerIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 6, height: 12)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [functionLabel, imageRight])
         stackView.axis = .horizontal
         stackView.spacing = 10
         return stackView
     }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          layoutUI()
      }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }

    
    private func layoutUI(){
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
    
    func configure(data: String) {
        functionLabel.text = data
    }

}
