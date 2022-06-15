//
//  MyOrdersViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

class MyOrdersViewController: UIViewController {
    private let store: MyOrdersStore
    @IBOutlet private var tableView: UITableView!
    
    init(store: MyOrdersStore) {
        self.store = store
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
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        [MyOrdersViewCell.self].forEach {
            tableView.register(cellClass: $0)
        }
    }
    
    private func setupObservers() {
        store.$state.observe(self) { vc, state in
            guard let state = state else { return }
            switch state {
            case .orderTapped:
                break
            case .ordersLoaded:
                vc.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension MyOrdersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MyOrdersViewCell else { return }
        cell.configure(order: store.orders[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 132
    }
}

// MARK: - UITableViewDataSource

extension MyOrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        store.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyOrdersViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
