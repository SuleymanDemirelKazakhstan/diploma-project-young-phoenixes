//
//  UITableView+Dequeue.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<Cell: UITableViewHeaderFooterView>() -> Cell {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: "\(Cell.self)") as? Cell else {
            fatalError("register(aClass:) has not been implemented")
        }
        return view
    }
}

