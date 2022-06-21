//
//  HomeMainViewDelegate.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

final class HomeMainTableViewDelegateImpl: NSObject {
    var tableView: UITableView?
    var sections: [HomeSection] = []
    private let store: HomeStore

    init(store: HomeStore) {
        self.store = store
    }
}

extension HomeMainTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch sections[indexPath.section].rows[indexPath.row] {
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .categories:
            guard let cell = cell as? HomeCategoriesCell  else { return }
            cell.configure()
        case .recommendations:
            guard let cell = cell as? HomeRecommendationsCell else { return }
            cell.configure()
        case .faqs:
            guard let cell = cell as? HomeFAQCell else { return }
            cell.configure()
        default:
            guard let cell = cell as? HomeTitleCell else { return }
            cell.configue(cellModel: .init(titleText: "text"))
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .title:
            return 28
        case .banners:
            return 112
        case .categories:
            return 296
        case .recommendations:
            return 458
        case .faqs:
            return 344
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .title:
            return 28
        case .banners:
            return 112
        case .categories:
            return 296
        case .recommendations:
            return 458
        case .faqs:
            return 344
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section].type {
        case .category, .recommendation, .faq:
            let view: SectionHeaderView = tableView.dequeueReusableHeaderFooterView()
            view.tag = section
            view.configure(with: ProfileHomeSectionHeaderViewModel(section: sections[section]))
            return view
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        heightForFooter(for: sections[section])
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        heightForFooter(for: sections[section])
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    private func heightForHeader(in section: Int) -> CGFloat {
        switch sections[section].type {
        case .category, .faq, .recommendation:
            return 64
        default:
            return 0
        }
    }

    private func heightForFooter(for section: HomeSection) -> CGFloat {
        return 0
    }
}

// MARK: - HomeRecommendationViewDelegate

extension HomeMainTableViewDelegateImpl: HomeRecommendationViewDelegate {
    func categoryDidSelect(_ view: HomeRecommendationView, category: String) {
        store.dispatch(action: .didTapCategory(category: category))
    }
}
