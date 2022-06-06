//
//  HomeMainStore.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

struct HomeSection {
    enum SectionType {
        case title, banners, category, recommendation, faq
    }
    
    enum RowType {
        case title
        case banners
        case categories
        case recommendations
        case faqs
    }
    
    let type: SectionType
    let rows: [RowType]
}

// swiftlint:disable file_length type_body_length

final class HomeStore {
    enum Action {
        case didLoadView
        case willAppearView
    }
    
    enum State {
        case loading
        case loadingFinished
        case error(message: String?)
        case sections(sections: [HomeSection])
    }
    
    private var isLoaded: Bool
    private var sections: [HomeSection] = []

    @Observable private(set) var state: State?
    
    init() {
        isLoaded = false
    }
    
    // swiftlint:disable function_body_length cyclomatic_complexity
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            state = .loading
            configureSections()
            getStorageContent()
        case .willAppearView:
            getStorageContent()
        }
    }
    
    private func getStorageContent() {
    }
        
    private func configureSections() {
        sections = [
            .init(type: .banners, rows: [.banners]),
            .init(type: .category, rows: [.categories]),
            .init(type: .recommendation, rows: [.recommendations]),
            .init(type: .faq, rows: [.faqs])
        ]
        state = .sections(sections: sections)
    }
}
