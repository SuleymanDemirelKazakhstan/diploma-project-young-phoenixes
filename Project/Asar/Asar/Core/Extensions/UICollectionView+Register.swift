//
//  UICollectionView+Register.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

extension UICollectionView {
    func register(cellClass: AnyClass) {
        let nib = UINib(nibName: "\(cellClass)", bundle: Bundle(for: cellClass))
        register(nib, forCellWithReuseIdentifier: "\(cellClass)")
    }

    func register(viewClass: AnyClass, forSupplementaryViewOfKind kind: String) {
        let nib = UINib(nibName: "\(viewClass)", bundle: Bundle(for: viewClass))
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: "\(viewClass)")
    }
}

