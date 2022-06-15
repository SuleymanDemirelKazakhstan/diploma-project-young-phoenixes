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
    let db = Firestore.firestore()
    
    
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
    
    private let phonenumberView: UIView = {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 10
        return innerView
    }()
    
    private let phoneNumberTextField: UITextField = {
          let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.backgroundColor = UIColor.white
          return textField
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "accept"),
            style: .done,
            target: self,
            action: #selector(didTapAccept))
        phoneNumberTextField.delegate = self
        let docRef = db.collection("users").document(Auth.auth().currentUser?.email ?? "")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            guard let phoneNumber = data["phoneNumber"] as? String else{
                return
            }
            
            DispatchQueue.main.async {
                self.phoneNumberTextField.text = phoneNumber
            }
        }
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
        
        view.addSubview(phonenumberView)
        phonenumberView.snp.makeConstraints {
            $0.top.equalTo(mailView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        phonenumberView.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        view.addSubview(numberView)
        numberView.snp.makeConstraints {
            $0.top.equalTo(phonenumberView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        numberView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
      
    }
    
    @objc private func didTapAccept(){
    }
    
    private func updateUI() {
       guard let user = Auth.auth().currentUser else { return }
        mailLabel.text = user.email
        numberLabel.text = user.uid
//        phoneNumberTextField.text = user.email
     }
    
    func saveData(phoneNumber: String){
        let docRef = db.collection("users").document(Auth.auth().currentUser?.email ?? "")
        docRef.setData(["phoneNumber": phoneNumber])
    }
}


extension ProfileInformationViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let phoneNumber = textField.text, !phoneNumber.isEmpty{
            saveData(phoneNumber: phoneNumber)
        }
        return true
    }
}
