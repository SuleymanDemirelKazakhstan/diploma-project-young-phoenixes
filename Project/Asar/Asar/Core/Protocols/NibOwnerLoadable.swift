//
//  NibOwnerLoadable.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.04.2022.
//


import UIKit

protocol NibOwnerLoadable: AnyObject {
    static var nib: UINib { get }
}

extension NibOwnerLoadable {
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibOwnerLoadable where Self: UIView {
    func loadNibContent() {
        let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
        for case let view as UIView in type(of: self).nib.instantiate(withOwner: self, options: nil) {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            NSLayoutConstraint.activate(layoutAttributes.map {
                NSLayoutConstraint(item: view, attribute: $0, relatedBy: .equal, toItem: self, attribute: $0, multiplier: 1, constant: 0)
            })
        }
    }
}
