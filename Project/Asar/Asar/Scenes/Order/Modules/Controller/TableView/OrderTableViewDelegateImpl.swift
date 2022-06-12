//
//  OrderTableViewDelegateImpl.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit
import FirebaseAuth

final class OrderTableViewDelegateImpl: NSObject {
    var tableView: UITableView?
    var form: OrderForm?
//    var formatter: PhoneNumberFormatter?
    var rows: [OrderRow] = []
    private let store: OrderStore

    init(store: OrderStore) {
        self.store = store
    }
}

extension OrderTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = rows[indexPath.row]
        switch row {
        case .header:
            guard let cell = cell as? OrderHeaderCell else { return }
            cell.awakeFromNib()
        case .description,.category, .phoneNumber, .address, .date, .paymentWay:
            guard let cell = cell as? OrderFieldCell else { return }
            cell.configure(cellModel: .init(row: row, form: .init(desciption: nil, phoneNumber: Auth.auth().currentUser?.phoneNumber, category: nil, paymentWay: nil, files: [], content: nil)))
        case .content:
            guard let cell = cell as? OrderUploadCell else { return }
            cell.awakeFromNib()
        default:
            guard let cell = cell as? OrderFieldCell else {
                return
            }
            cell.configure(cellModel: .init(row: .description, form: .init()))
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
        case .header:
            return 40
        case .description:
            return 124
        case .category, .phoneNumber, .address, .date, .paymentWay:
            return 88
        case .content:
            return 104
        case .files:
            return 88
        }
    }
}

// MARK: - FeedbackSelectCellDelegate

//extension OrderTableViewDelegateImpl: FeedbackSelectCellDelegate {
//    func answerTypeDidSelect(_ cell: FeedbackSelectCell, answerType: OrderFormAnswerType) {
//        store.dispatch(action: .didSelectAnswerType(type: answerType))
//    }
//}

// MARK: - FeedbackFieldCellDelegate

//extension OrderTableViewDelegateImpl: FeedbackFieldCellDelegate {
//    func dropDownButtonDidTap(_ cell: FeedbackFieldCell) {
//        guard let indexPath = tableView?.indexPath(for: cell) else { return }
//        store.dispatch(action: .didTapDropDown(row: rows[indexPath.row]))
//    }
//
//    func textFieldDidChange(_ cell: FeedbackFieldCell, textField: BaseTextField) {
//        guard let indexPath = tableView?.indexPath(for: cell) else { return }
//        store.dispatch(action: .didChangeTextField(text: textField.text ?? "", row: rows[indexPath.row]))
//    }
//}

// MARK: - FeedbackFilesCellDelegate

//extension OrderTableViewDelegateImpl: FeedbackFilesCellDelegate {
//    func deleteItemDidSelect(_ cell: FeedbackFilesCell, at indexPath: IndexPath) {
//        store.dispatch(action: .didDeleteFile(index: indexPath.item))
//    }
//}

