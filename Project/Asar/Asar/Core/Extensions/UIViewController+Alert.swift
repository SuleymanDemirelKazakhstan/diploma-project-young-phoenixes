//
//  UIViewController+Alert.swift
//  Asar
//
//  Created by Abylbek Khassenov on 18.04.2022.
//

import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 16
}

extension UIViewController {
    func presentAlert(title: String?, description: String? = nil, attributedDescription: String? = nil, actions: [UIAlertAction] = []) {
        guard (title ?? description ?? attributedDescription)?.isEmpty == false else { return }
        let alertController = UIAlertController(title: title, message: description ?? "", preferredStyle: .alert)
        if actions.isEmpty {
            alertController.addAction(.init(title: "OK", style: .cancel))
        } else {
            actions.forEach {
                alertController.addAction($0)
            }
        }
        if let message = attributedDescription {
            let attributedMessage = NSAttributedString(string: message, attributes: [
                .font: Fonts.paragraphSmallRegular,
                .foregroundColor: UIColor.black
            ])
            alertController.setValue(attributedMessage, forKey: "attributedMessage")
        }
        alertController.view.tintColor = .black
        alertController.view.backgroundColor = .white
        alertController.view.layer.cornerRadius = Constants.cornerRadius
        present(alertController, animated: true)
    }
}
