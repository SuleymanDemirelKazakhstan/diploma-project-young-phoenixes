//
//  QuestionCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 13.06.2022.
//

import UIKit

class QuestionCell: UITableViewCell {

    var isAnswerVisible = false
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 6, height: 12)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [questionLabel, chevronImage])
         stackView.axis = .horizontal
         stackView.spacing = 5
        return stackView
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
        setUpStackView()
        
        chevronImage.snp.makeConstraints {
            $0.height.width.equalTo(14)
        }
    }
    
    func setUpStackView(){
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }

    func animateChevron() {
        isAnswerVisible.toggle()
        let toValue = isAnswerVisible ? (CGFloat.pi / 2) : 0.0
        let fromValue = isAnswerVisible ? 0.0 : (CGFloat.pi / 2)
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.25
        animation.isCumulative = true
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        chevronImage.layer.add(animation, forKey: "rotationAnimation")
    }
    
}
