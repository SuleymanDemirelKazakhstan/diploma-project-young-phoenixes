//
//  HomeMainViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

class HomeMainViewController: UIViewController {
    private let store: HomeStore
    private let tableViewDataSourceImpl: HomeMainViewDataSourceImpl
    private let tableViewDelegateImpl: HomeMainTableViewDelegateImpl
    
    @IBOutlet private var tableView: UITableView!
    
    init() {
        store = .init()
        tableViewDataSourceImpl = .init()
        tableViewDelegateImpl = .init(store: store)
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservers()
        store.dispatch(action: .didLoadView)
    }

    private func setupUI() {
        setupTableView()
    }

    private func setupTableView() {
        tableViewDelegateImpl.tableView = tableView
        tableView.dataSource = tableViewDataSourceImpl
        tableView.delegate = tableViewDelegateImpl
        [SectionHeaderView.self].forEach {
            tableView.register(aClass: $0)
        }
        [HomeBannerCell.self ,HomeTitleCell.self, HomeCategoriesCell.self, HomeRecommendationsCell.self, HomeFAQCell.self].forEach { tableView.register(cellClass: $0) }
    }

    private func setupObservers() {
        store.$state.observe(self) { vc, state in
            guard let state = state else { return }
            switch state {
            case let .sections(sections):
                vc.tableViewDataSourceImpl.sections = sections
                vc.tableViewDelegateImpl.sections = sections
                vc.tableView.reloadData()
            case .loading:
                print("")
            case .loadingFinished:
                print("")
            case let .error(message):
                print(message!)
            case let .categoryTapped(categoty):
                break
            }
        }
    }
}
