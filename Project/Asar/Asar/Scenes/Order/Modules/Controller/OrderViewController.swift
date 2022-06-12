//
//  OrderViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

protocol OrderNavigationDelegate: AnyObject {
    func closeDidTap(_ viewController: OrderViewController)
//    func regionSelectDidTap(_ viewController: OrderViewController, region: Region?)
    func formDidVerify(_ viewController: OrderViewController)
    func mapDidTap(_ viewController: OrderViewController)
}

class OrderViewController: UIViewController {
    private let store: OrderStore
    private let tableViewDataSourceImpl: OrderTableViewDataSourceImpl
    private let tableViewDelegateImpl: OrderTableViewDelegateImpl
    private weak var navigationDelegate: OrderNavigationDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionView: BottomActionButton!
    
    init(store: OrderStore, navigationDelegate: OrderNavigationDelegate) {
        self.store = store
        tableViewDataSourceImpl = .init(store: store)
        tableViewDelegateImpl = .init(store: store)
        self.navigationDelegate = navigationDelegate
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

//    func updateRegion(region: Region) {
//        store.dispatch(action: .didUpdateRegion(region: region))
//    }

    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        actionView.delegate = self
        actionView.configureTitle(text: "Создать")
        actionView.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        tableViewDataSourceImpl.tableView = tableView
        tableViewDelegateImpl.tableView = tableView
        tableView.dataSource = tableViewDataSourceImpl
        tableView.delegate = tableViewDelegateImpl
        [
            OrderFieldCell.self,
            OrderHeaderCell.self,
            OrderUploadCell.self
        ].forEach { tableView.register(cellClass: $0) }
    }

    private func setupObservers() {
        store.$state.observe(self) { vc, state in
            guard let state = state else { return }
            switch state {
            case let .rows(rows, form):
                vc.tableViewDataSourceImpl.rows = rows
                vc.tableViewDataSourceImpl.form = form
                vc.tableViewDelegateImpl.rows = rows
                vc.tableViewDelegateImpl.form = form
                vc.tableView.reloadData()
            case .loading:
                break
            case .loadingFinished:
                break
            case let .error(message):
                break
            case let .textFieldChanged(form):
                vc.tableViewDataSourceImpl.form = form
                vc.tableViewDelegateImpl.form = form
            case let .contentChanged(form):
                vc.tableViewDataSourceImpl.form = form
                vc.tableViewDelegateImpl.form = form
            case .mapTapped:
                vc.navigationDelegate?.mapDidTap(self)
            }
        }
    }
}

private extension OrderViewController {
    @objc
    func closeButtonDidTap() {
        navigationDelegate?.closeDidTap(self)
    }
}

// MARK: - BottomActionsViewDelegate

extension OrderViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        
    }
}
