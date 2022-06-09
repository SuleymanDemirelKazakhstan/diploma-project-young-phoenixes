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
}

class OrderViewController: UIViewController {
//    private let store: FeedbackStore
    private let tableViewDataSourceImpl: OrderTableViewDataSourceImpl
    private let tableViewDelegateImpl: OrderTableViewDelegateImpl
    private weak var navigationDelegate: OrderNavigationDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionView: BottomActionButton!
    
    init(navigationDelegate: OrderNavigationDelegate) {
//        self.store = store
        tableViewDataSourceImpl = .init()
        tableViewDelegateImpl = .init()
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
//        store.dispatch(action: .didLoadView)
    }

//    func updateRegion(region: Region) {
//        store.dispatch(action: .didUpdateRegion(region: region))
//    }

    private func setupUI() {
        setupNavigationBar()
        actionView.delegate = self
        actionView.configureTitle(text: "Создать")
        setupTableView()
    }

    private func setupTableView() {
        tableViewDataSourceImpl.tableView = tableView
        tableViewDelegateImpl.tableView = tableView
//        tableView.dataSource = tableViewDataSourceImpl
//        tableView.delegate = tableViewDelegateImpl
        [
//            FeedbackContentCell.self,
//            FeedbackSelectCell.self,
//            FeedbackFieldCell.self,
//            FeedbackFilesCell.self
        ].forEach { tableView.register(cellClass: $0) }
    }

    private func setupObservers() {
//        store.$state.observe(self) { vc, state in
//            guard let state = state else { return }
//            switch state {
//            case let .rows(rows, form, formatter):
//                vc.tableViewDataSourceImpl.rows = rows
//                vc.tableViewDataSourceImpl.form = form
//                vc.tableViewDelegateImpl.rows = rows
//                vc.tableViewDelegateImpl.form = form
//                vc.tableViewDelegateImpl.formatter = formatter
//                vc.tableView.reloadData()
//            case .loading:
//                ProgressHud.startAnimating()
//            case .loadingFinished:
//                ProgressHud.stopAnimating()
//            case let .error(message):
//                vc.showToast(category: .error, message: message)
//            case let .textFieldChanged(form):
//                vc.tableViewDataSourceImpl.form = form
//                vc.tableViewDelegateImpl.form = form
//            case let .contentChanged(form):
//                vc.tableViewDataSourceImpl.form = form
//                vc.tableViewDelegateImpl.form = form
//            case let .messageSubjectSelected(subjects):
//                vc.presentThemesActionSheet(subjects: subjects)
//            case let .regionSelectTapped(region):
//                vc.navigationDelegate?.regionSelectDidTap(vc, region: region)
//            case .feedbackSent:
//                vc.navigationDelegate?.formDidVerify(vc)
//            case let .attachmentTapped(items):
//                vc.presentAttachmentActionSheet(items: items)
//            }
//        }
    }

//    private func presentThemesActionSheet(subjects: [MessageSubject]) {
//        var items: [ActionSheetItem] = subjects.map { subject in
//            ActionSheetItem(title: subject.name) { [weak self] in
//                guard let self = self else { return }
//                self.store.dispatch(action: .didSelectMessageSubject(subject: subject))
//            }
//        }
//        items.append(ActionSheetItem(title: L10n.dpMainSceneCancel))
//        presentActionSheet(title: nil, message: L10n.feedbackEmptySubject, items: items)
//    }
//
//    private func presentAttachmentActionSheet(items: [ActionSheetItem]) {
//        var items: [ActionSheetItem] = items
//        items.append(ActionSheetItem(title: L10n.dpMainSceneCancel))
//        presentActionSheet(title: nil, message: nil, items: items)
//    }
//
//    private func updateColors() {
//        view.backgroundColor = Colors.fill2
//        navigationController?.navigationBar.backgroundColor = Colors.fill2
//        navigationController?.navigationBar.barTintColor = Colors.fill2
//    }
}

private extension OrderViewController {
    @objc
    func closeButtonDidTap() {
        navigationDelegate?.closeDidTap(self)
    }

    func setupNavigationBar() {
        navigationItem.title = "Создать заявку"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Assets.generalClose.image,
//                                                           style: .plain,
//                                                           target: self,
//                                                           action: #selector(closeButtonDidTap))
    }
}

// MARK: - BottomActionsViewDelegate

extension OrderViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
    }
}
