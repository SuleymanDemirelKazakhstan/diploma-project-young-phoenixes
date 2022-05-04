//
//  HomeMainViewDataSourceImpl.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

final class HomeMainViewDataSourceImpl: NSObject {
    var sections: [HomeSection] = []
}

extension HomeMainViewDataSourceImpl: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .title:
            let cell: HomeTitleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case .categories:
            let cell: HomeCategoriesCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case .recommendations:
            let cell: HomeRecommendationsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            let cell: HomeTitleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
}
