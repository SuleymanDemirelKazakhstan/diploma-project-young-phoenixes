//
//  ProfileInformationViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class ProfileInformationViewController: UIViewController {

    let defaults = UserDefaults.standard
    let email = Auth.auth().currentUser?.uid
    
    private let photoView: UIImageView = {
        let photoView = UIImageView(image: UIImage(named: "ava")!)
        photoView.clipsToBounds = true
        photoView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        photoView.contentMode = .scaleAspectFill
        return photoView
    }()
    
    private let mailView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let numberView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .systemGray6
        setup()
        updateUI()
    }
    
    private func setup(){
        view.addSubview(photoView)
        photoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        view.addSubview(mailView)
        mailView.snp.makeConstraints {
            $0.top.equalTo(photoView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(56)

        }
        
        mailView.addSubview(mailLabel)
        mailLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        view.addSubview(numberView)
        numberView.snp.makeConstraints {
            $0.top.equalTo(mailView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        numberView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
      
    }
    
    private func updateUI() {
       guard let user = Auth.auth().currentUser else { return }
        mailLabel.text = user.email
        numberLabel.text = user.uid
     }
    
    
}

