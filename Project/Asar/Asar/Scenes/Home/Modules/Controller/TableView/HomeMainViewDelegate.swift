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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .title:
            guard let cell = cell as? HomeTitleCell else { return }
            cell.configue(cellModel: .init(titleText: "text"))
        case .categories:
            guard let cell = cell as? HomeCategoriesCell  else { return }
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
        case .categories:
            return 296
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .title:
            return 28
        case .categories:
            return 296
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
//        switch sections[section].type {
//        case .faqCategories:
//            let view: FAQSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
//            view.configure(with: FAQHomeSectionHeaderViewModel(section: sections[section]))
//            return view
//        default:
//            return nil
//        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        heightForFooter(for: sections[section])
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        heightForFooter(for: sections[section])
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
//        switch sections[section].type {
//        case .faqCategories:
//            let view: FAQHomeSectionFooterView = tableView.dequeueReusableHeaderFooterView()
//            return view
//        default:
//            return nil
//        }
    }

    private func heightForHeader(in section: Int) -> CGFloat {
        return 0
//        switch sections[section].type {
//        case .faqCategories:
//            return 32
//        case .options:
//            return 24
//        }
    }

    private func heightForFooter(for section: HomeSection) -> CGFloat {
        return 0
//        switch section.type {
//        case .faqCategories:
//            return 24
//        case .options:
//            return 16
//        }
    }

//    private func heightForCategories(faqCategories: [FAQCategory]) -> CGFloat {
//        let rowCount = faqCategories.count / 3
//        let additionalRowCount = faqCategories.count.isMultiple(of: 3) ? 0 : 1
//        let overallCount = rowCount + additionalRowCount
//        return CGFloat(overallCount * 104 + (overallCount - 1) * 8)
//    }
}

// MARK: - FAQHomeCategoriesCellDelegate

//extension FAQHomeTableViewDelegateImpl: FAQHomeCategoriesCellDelegate {
//    func categoryDidSelect(_ cell: FAQHomeCategoriesCell, indexPath: IndexPath) {
//        store.dispatch(action: .didSelectCategory(index: indexPath.item))
//    }
//}

// MARK: - MaskedOptionCellDelegate

//extension FAQHomeTableViewDelegateImpl: MaskedOptionCellDelegate {
//    func optionButtonDidTap(_ cell: MaskedOptionCell) {
//        guard let indexPath = tableView?.indexPath(for: cell) else { return }
//        store.dispatch(action: .didTapOption(index: indexPath.row))
//    }
//}
