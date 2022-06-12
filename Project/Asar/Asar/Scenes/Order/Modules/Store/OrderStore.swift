//
//  OrderStore.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

enum OrderFileType {
    case image(image: UIImage)
    case data(data: Data)
}

struct OrderForm {
    var desciption: String?
    var phoneNumber: String?
    var category: String?
    var paymentWay: String?
    var files: [OrderFileType] = []
    var content: String?
}

enum OrderRow {
    case header
    case description
    case category
    case phoneNumber
    case address
    case date
    case paymentWay
    case files
    case content
}

// swiftlint:disable file_length
final class OrderStore {
    enum Action {
        case didLoadView
        case didChangeTextField(text: String?, row: OrderRow)
        case didChangeContent(text: String?)
        case didTapDropDown(row: OrderRow)
        case didTapAttachment
        case didTapSend
        case didDeleteFile(index: Int)
    }

    enum State {
        case rows(rows: [OrderRow], form: OrderForm)
        case loading
        case loadingFinished
        case error(message: String?)
        case textFieldChanged(form: OrderForm)
        case contentChanged(form: OrderForm)
    }
    
    private var form: OrderForm = .init()
    private var rows: [OrderRow] = []

    @Observable private(set) var state: State?

    init() {
//        self.imagePickerService = imagePickerService
//        self.documentPickerService = documentPickerService
    }

    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            updateList()
        case let .didChangeTextField(text, row):
            didChangeTextField(text: text?.trimmingCharacters(in: .whitespacesAndNewlines), row: row)
        case let .didChangeContent(text):
            form.content = text
            state = .contentChanged(form: form)
        case let .didTapDropDown(row):
            didTapDropDown(row: row)
        case .didTapAttachment:
            break
//            let sourceTypes: [UIImagePickerController.SourceType] = [.camera, .photoLibrary]
//            var items: [ActionSheetItem] = sourceTypes.compactMap { type in
//                guard UIImagePickerController.isSourceTypeAvailable(type), let title = title(for: type) else { return nil }
//                return ActionSheetItem(title: title) { [weak self] in
//                    self?.imagePickerService.presentImagePicker(sourceType: type)
//                }
//            }
//            items.append(ActionSheetItem(title: L10n.feedbackDocuments) { [weak self] in
//                self?.documentPickerService.presentDocumentPicker()
//            })
//            state = .attachmentTapped(items: items)
        case let .didDeleteFile(index):
            form.files.remove(at: index)
            updateList()
        case .didTapSend:
            verifyFeedbackForm()
        }
    }

    private func setupRows() {
        let rows: [OrderRow] = [
            .header, .description, .category,
            .phoneNumber, .address, .date,
            .paymentWay,.content
        ]
        self.rows = rows
    }

    private func title(for type: UIImagePickerController.SourceType) -> String? {
        type == .camera ? "" : ""
    }

    private func updateList() {
        setupRows()
        state = .rows(rows: rows, form: form)
    }

    private func didChangeTextField(text: String?, row: OrderRow) {
        switch row {
        case .description:
            form.desciption = text
        case .phoneNumber:
            form.phoneNumber = text
        default:
            break
        }
        state = .textFieldChanged(form: form)
    }

    private func didTapDropDown(row: OrderRow) {
        switch row {
        case .category:
            break
//            state = .messageSubjectSelected(subjects: storage.messageSubjects)
        case .paymentWay:
            break
//            state = .regionSelectTapped(region: form.region)
        default:
            break
        }
    }

    private func verifyFeedbackForm() {
        guard let description = form.desciption, !description.isEmpty else {
            state = .error(message: "")
            return
        }
        guard let phoneNumber = form.phoneNumber, !phoneNumber.isEmpty else {
            state = .error(message: "")
            return
        }
        state = .loading
        sendForm()
    }

    private func sendForm() {
        
    }
}
//
//extension OrderStore: DocumentPickerServiceDelegate {
//    func didPickDocument(_ service: DocumentPickerService, data: Data) {
//        form.files.append(.data(data: data))
//        updateList()
//    }
//}
//
//extension OrderStore: ImagePickerServiceDelegate {
//    func didPickImage(_ service: ImagePickerService, image: UIImage) {
//        form.files.append(.image(image: image))
//        updateList()
//    }
//
//    func didCropImage(_ service: ImagePickerService, image: UIImage) {}
//}

