//
//  UICollectionView+Dequeue.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<View: UICollectionReusableView>(ofKind elementKind: String,
                                                                          for indexPath: IndexPath) -> View {
        guard let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: "\(View.self)", for: indexPath) as? View else {
            fatalError("register(aClass:) has not been implemented")
        }
        return view
    }
}

