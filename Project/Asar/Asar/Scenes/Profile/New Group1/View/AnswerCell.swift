//
//  AnswerCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 13.06.2022.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setUp(){
        contentView.addSubview(answerLabel)
        answerLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }

}
