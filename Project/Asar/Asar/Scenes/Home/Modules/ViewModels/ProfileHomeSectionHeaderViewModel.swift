//
//  ProfileHomeSectionHeaderViewModel.swift
//  Asar
//
//  Created by Abylbek Khassenov on 06.06.2022.
//

import UIKit

struct ProfileHomeSectionHeaderViewModel: ActionSectionHeaderViewModelProtocol {
    var title: String? {
        switch section.type {
        case .category:
            return L10n.mainCategoriesTitle
        case .faq:
            return L10n.mainFAQTitle
        case .recommendation:
            return L10n.mainFeaturedTitle
        default:
            return nil
        }
    }
    
    private let section: HomeSection
    
    init(section: HomeSection) {
        self.section = section
    }
}
