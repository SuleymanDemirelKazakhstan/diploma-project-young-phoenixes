//
//  Utilities.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.04.2022.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield: UITextField, y: CGFloat? = 2) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - (y ?? 0), width: textfield.frame.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
