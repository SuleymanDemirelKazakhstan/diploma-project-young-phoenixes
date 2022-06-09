//
//  OrderTableViewDataSourceImpl.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

final class OrderTableViewDataSourceImpl: NSObject {
    var tableView: UITableView?
    var form: OrderForm?
    var rows: [OrderRow] = []
    private let store: OrderStore

    init() {
//        self.store = store
    }
}

extension OrderTableViewDataSourceImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .answerType:
            let cell: FeedbackSelectCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case .files:
            let cell: FeedbackFilesCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case .content:
            let cell: FeedbackContentCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            cell.configure(with: form?.content)
            return cell
        default:
            let cell: FeedbackFieldCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
}

// MARK: - MultilineTextFieldXibViewDelegate

extension OrderTableViewDataSourceImpl: FeedbackContentCellDelegate {
    func textViewDidChange(_ cell: FeedbackContentCell, textView: UITextView) {
        store.dispatch(action: .didChangeContent(text: textView.text))
        let size = textView.bounds.size
        let newSize = textView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))

        if size.height != newSize.height {
            UIView.setAnimationsEnabled(false)
            tableView?.beginUpdates()
            tableView?.endUpdates()
            UIView.setAnimationsEnabled(true)

            if let thisIndexPath = tableView?.indexPath(for: cell) {
                tableView?.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
            }
        }
    }
    
    func attachmentButtonDidTap(_ cell: FeedbackContentCell) {
        store.dispatch(action: .didTapAttachment)
    }
}

