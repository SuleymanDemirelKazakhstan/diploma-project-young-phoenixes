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
            return "Категории"
        case .faq:
            return "Часто задаваемые вопросы"
        case .recommendation:
            return "Рекоммендуемые"
        default:
            return nil
        }
    }
    
    private let section: HomeSection
    
    init(section: HomeSection) {
        self.section = section
    }
}
