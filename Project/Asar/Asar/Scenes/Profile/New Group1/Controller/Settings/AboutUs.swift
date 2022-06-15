//
//  AboutUs.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 15.06.2022.
//

import UIKit

class AboutUs: UIViewController {

    private let iconLabel: UILabel = {
        let label = UILabel()
        label.text = "Asar"
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Версия 1.0"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "Мобильное приложение для поиска ближайших специалистов по местоположению"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [iconLabel, versionLabel])
         stackView.axis = .vertical
         stackView.spacing = 4
         return stackView
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setUp()
    }
    
    private func setUp(){
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        view.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stackView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
}
