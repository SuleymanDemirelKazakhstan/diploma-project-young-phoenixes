//
//  OrderTableViewDelegateImpl.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

final class OrderTableViewDelegateImpl: NSObject {
    var tableView: UITableView?
    var form: OrderForm?
    var formatter: PhoneNumberFormatter?
    var rows: [OrderRow] = []
    private let store: OrderStore

    init() {
//        self.store = store
    }
}

extension OrderTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = rows[indexPath.row]
        switch row {
        case .answerType:
            guard let cell = cell as? FeedbackSelectCell else { return }
            cell.delegate = self
        case .files:
            guard let cell = cell as? FeedbackFilesCell else { return }
            cell.delegate = self
            cell.configure(with: form?.files ?? [])
        default:
            guard let cell = cell as? FeedbackFieldCell,
                let form = form,
                let formatter = formatter else { return }
            cell.delegate = self
            cell.configure(with: .init(row: row, form: form, formatter: formatter))
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        heightForRow(at: indexPath, isEstimated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightForRow(at: indexPath, isEstimated: false)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }

    private func heightForRow(at indexPath: IndexPath, isEstimated: Bool) -> CGFloat {
        switch rows[indexPath.row] {
        case .content:
            return isEstimated ? 56 : UITableView.automaticDimension
        case .answerType:
            return 208
        case .files:
            return 88
        default:
            return 68
        }
    }
}

// MARK: - FeedbackSelectCellDelegate

extension OrderTableViewDelegateImpl: FeedbackSelectCellDelegate {
    func answerTypeDidSelect(_ cell: FeedbackSelectCell, answerType: OrderFormAnswerType) {
        store.dispatch(action: .didSelectAnswerType(type: answerType))
    }
}

// MARK: - FeedbackFieldCellDelegate

extension OrderTableViewDelegateImpl: FeedbackFieldCellDelegate {
    func dropDownButtonDidTap(_ cell: FeedbackFieldCell) {
        guard let indexPath = tableView?.indexPath(for: cell) else { return }
        store.dispatch(action: .didTapDropDown(row: rows[indexPath.row]))
    }

    func textFieldDidChange(_ cell: FeedbackFieldCell, textField: BaseTextField) {
        guard let indexPath = tableView?.indexPath(for: cell) else { return }
        store.dispatch(action: .didChangeTextField(text: textField.text ?? "", row: rows[indexPath.row]))
    }
}

// MARK: - FeedbackFilesCellDelegate

extension OrderTableViewDelegateImpl: FeedbackFilesCellDelegate {
    func deleteItemDidSelect(_ cell: FeedbackFilesCell, at indexPath: IndexPath) {
        store.dispatch(action: .didDeleteFile(index: indexPath.item))
    }
}

