//
//  PoliticalConfCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 12.06.2022.
//

import UIKit

typealias PoliticalConfCellConfigurator = TableCellConfigurator<PoliticalConfCell, PoliticalConfModel>

class PoliticalConfCell: UITableViewCell, ConfigurableCell {

    typealias DataType = PoliticalConfModel
    
    
    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
   private let confLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
       label.numberOfLines = 0
        return label
    }()
    
    private let firstLabel: UILabel = {
         let label = UILabel()
         label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
         return label
     }()
    
    private let secondLabel: UILabel = {
         let label = UILabel()
         label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
         return label
     }()
    
    private let thirdLabel: UILabel = {
         let label = UILabel()
         label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
         return label
     }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [confLabel, firstLabel, secondLabel, thirdLabel])
         stackView.axis = .vertical
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
        }
        innerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
    
    func configure(data: PoliticalConfModel) {
        confLabel.text = data.conflabel
        firstLabel.text = data.firstlabel
        secondLabel.text = data.secondlabel
        thirdLabel.text = data.thirdlabel
    }

}
