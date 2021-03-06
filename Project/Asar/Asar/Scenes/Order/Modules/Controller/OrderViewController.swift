//
//  OrderViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit
import FirebaseFirestore

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
    private let shodowView = UIView()
    private weak var navigationDelegate: OrderNavigationDelegate?
    var vSpinner : UIView?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionView: BottomActionButton!
    
    private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
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
        setupDatePicker()
        store.dispatch(action: .didLoadView)
    }
    
    func mapSelected() {
        store.dispatch(action: .didChangeTextField(text: "Абылбайхана 1/1", row: .address))
    }

    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        actionView.delegate = self
        actionView.configureTitle(text: "Создать")
        actionView.backgroundColor = .systemBackground
        hideKeyboardWhenTappedAround()
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
    
    private func setupDatePicker() {
        datePicker.frame = CGRect(x: tableView.frame.width / 2 - 50, y: tableView.frame.height / 2, width: 80, height: 30)
        datePicker.layer.cornerRadius = 50
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    private func showDatePicker() {
        shodowView.frame = view.frame
        shodowView.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(shodowView)
        view.addSubview(datePicker)
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
            case let .error(message):
                vc.presentAlert(title: message)
            case .formSended:
                vc.presentAlert(title: "Заявка успешно отправлена")
            case let .textFieldChanged(form):
                vc.tableViewDataSourceImpl.form = form
                vc.tableViewDelegateImpl.form = form
                vc.tableView.reloadData()
            case .mapTapped:
                vc.navigationDelegate?.mapDidTap(self)
            case .calendarTapped:
                self.showDatePicker()
            case .loading:
                vc.showSpinner(onView: vc.view)
            case .stopLoading:
                vc.removeSpinner()
            }
        }
    }
}

private extension OrderViewController {
    @objc
    func closeButtonDidTap() {
        navigationDelegate?.closeDidTap(self)
    }
    
    @objc
    func datePickerValueChanged() {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        datePicker.endEditing(true)
        datePicker.removeFromSuperview()
        shodowView.removeFromSuperview()
        store.dispatch(action: .didChangeTextField(text: selectedDate, row: .date))
    }
}

// MARK: - BottomActionsViewDelegate

extension OrderViewController: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        store.dispatch(action: .didTapSend)
    }
}

extension OrderViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}
