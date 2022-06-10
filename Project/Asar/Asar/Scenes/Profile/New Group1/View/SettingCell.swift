//
//  SettingCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

typealias SettingCellConfigurator = TableCellConfigurator<SettingCell, String>

class SettingCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = String
    
    
    private let innerView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 16
        return innerView
    }()
    
   private let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let switchOn = UISwitch()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [settingLabel, switchOn])
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
        settingLabel.text = data
    }

}
