//
//  UISearchBar+Subviews.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            searchTextField.layer.cornerRadius = 12
            searchTextField.clipsToBounds = true
            return searchTextField
        } else {
            guard let subview = subviews.first?.subviews.last else { return nil }
            for view in subview.subviews {
                if let textField = view as? UITextField {
                    textField.layer.cornerRadius = 12
                    textField.clipsToBounds = true
                    return textField
                }
            }
        }
        return nil
    }

    var cancelButton: UIButton? {
        guard let subview = subviews.first?.subviews.last else { return nil }
        for view in subview.subviews {
            if let button = view as? UIButton {
                return button
            }
        }
        return nil
    }
}

