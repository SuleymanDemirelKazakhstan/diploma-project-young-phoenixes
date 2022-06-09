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
    var name: String?
    var phoneNumber: String?
    var email: String?
//    var messageSubject: MessageSubject?
    var answerType: OrderFormAnswerType?
    var files: [OrderFileType] = []
    var content: String?
}

enum OrderFormAnswerType: Int, CaseIterable {
    case email = 0
    case phone
    case none
    
    var parameter: String {
        switch self {
        case .email:
            return "email"
        case .phone:
            return "phone"
        case .none:
            return ""
        }
    }
    
    var title: String {
        switch self {
        case .email:
            return ""
        case .phone:
            return ""
        case .none:
            return ""
        }
    }
}

enum OrderRow {
    case region
    case name
    case phoneNumber
    case email
    case messageSubject
    case answerType
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
//        case didSelectMessageSubject(subject: MessageSubject)
//        case didUpdateRegion(region: Region)
        case didSelectAnswerType(type: OrderFormAnswerType)
        case didTapAttachment
        case didTapSend
        case didDeleteFile(index: Int)
    }

    enum State {
//        case rows(rows: [OrderRow], form: OrderForm, formatter: PhoneNumberFormatter)
        case loading
        case loadingFinished
        case error(message: String?)
//        case messageSubjectSelected(subjects: [MessageSubject])
//        case regionSelectTapped(region: Region?)
        case textFieldChanged(form: OrderForm)
        case contentChanged(form: OrderForm)
        case feedbackSent
//        case attachmentTapped(items: [ActionSheetItem])
    }
//
//    private let userSession: UserSession
//    private let provider: FeedbackProvider
//    private let storage: ProfileStorage
//    private let imagePickerService: ImagePickerService
//    private let documentPickerService: DocumentPickerService
//    private let formatter: PhoneNumberFormatter

    private var form: OrderForm = .init()
    private var rows: [OrderRow] = []

    @Observable private(set) var state: State?

    init() {
//        self.userSession = userSession
//        self.provider = provider
//        self.storage = storage
//        self.imagePickerService = imagePickerService
//        self.documentPickerService = documentPickerService
//        self.formatter = formatter
    }

    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
//            if userSession.isActive {
//                form.name = storage.profile?.name.fullName(with: [.last, .first, .middle])
//                form.phoneNumber = storage.profile?.phoneNumber
//                form.email = storage.profile?.email
//            }
//            form.region = storage.selectedRegion
            getSubjects()
            updateList()
        case let .didChangeTextField(text, row):
            didChangeTextField(text: text?.trimmingCharacters(in: .whitespacesAndNewlines), row: row)
        case let .didChangeContent(text):
            form.content = text
            state = .contentChanged(form: form)
        case let .didTapDropDown(row):
            didTapDropDown(row: row)
//        case let .didSelectMessageSubject(subject):
//            form.messageSubject = subject
//            updateList()
        case let .didSelectAnswerType(type):
            form.answerType = type
//        case let .didUpdateRegion(region):
//            form.region = region
            updateList()
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
        var rows: [OrderRow] = [.region, .name, .phoneNumber, .email, .messageSubject, .answerType, .content]
        if !form.files.isEmpty { rows.append(.files) }
        self.rows = rows
    }

    private func title(for type: UIImagePickerController.SourceType) -> String? {
        type == .camera ? "" : ""
    }

    private func updateList() {
        setupRows()
//        state = .rows(rows: rows, form: form, formatter: formatter)
    }

    private func getSubjects() {
//        provider.getSubjects().then { [weak self] subjects in
//            self?.storage.messageSubjects = subjects
//        }.catch { [weak self] error in
//            self?.state = .error(message: error.wrappedError.localizedDescription)
//        }
    }

    private func didChangeTextField(text: String?, row: OrderRow) {
        switch row {
        case .name:
            form.name = text
        case .phoneNumber:
            form.phoneNumber = text
        case .email:
            form.email = text
        default:
            break
        }
        state = .textFieldChanged(form: form)
    }

    private func didTapDropDown(row: OrderRow) {
        switch row {
        case .messageSubject:
            break
//            state = .messageSubjectSelected(subjects: storage.messageSubjects)
        case .region:
            break
//            state = .regionSelectTapped(region: form.region)
        default:
            break
        }
    }

    private func verifyFeedbackForm() {
//        guard form.region != nil else {
//            state = .error(message: "")
//            return
//        }
        guard let name = form.name, !name.isEmpty else {
            state = .error(message: "")
            return
        }
        guard let phoneNumber = form.phoneNumber else {
            state = .error(message: "")
            return
        }
//        guard formatter.formattedPhoneNumber(from: phoneNumber) != nil else {
//            state = .error(message: "")
//            return
//        }
        guard form.email != nil else {
            state = .error(message: "")
            return
        }
        guard let email = form.email else {
            state = .error(message: "")
            return
        }
//        guard form.messageSubject != nil else {
//            state = .error(message: L10n.feedbackEmptySubject)
//            return
//        }
//        guard form.answerType != nil else {
//            state = .error(message: L10n.feedbackEmptyAnswerType)
//            return
//        }
//        guard !(form.content ?? "").isEmpty else {
//            state = .error(message: L10n.feedbackEmptyContent)
//            return
//        }
        state = .loading
        sendForm()
    }

    private func sendForm() {
//        provider.sendFeedback(form: form) { [weak self] response, message in
//            self?.state = .loadingFinished
//            guard response != nil else {
//                self?.state = .error(message: message)
//                return
//            }
//            self?.state = .feedbackSent
//        }
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

