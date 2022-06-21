//
//  OrderStore.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

enum OrderFileType {
    case image(image: UIImage)
    case data(data: Data)
}

struct OrderForm {
    var name: String?
    var desciption: String?
    var price: String?
    var phoneNumber: String?
    var category: String?
    var paymentWay: String?
    var files: [OrderFileType] = []
    var content: String?
    var date: String?
    var address: String?
}

enum OrderRow {
    case header
    case description
    case price
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
        case didTapAttachment
        case didTapMap
        case didTapCalendar
        case didTapSend
    }

    enum State {
        case rows(rows: [OrderRow], form: OrderForm)
        case error(message: String?)
        case textFieldChanged(form: OrderForm)
        case mapTapped
        case calendarTapped
        case formSended
        case loading
        case stopLoading
    }
    
    private var db = Firestore.firestore()
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
        case .didTapAttachment:
            break
        case .didTapMap:
            state = .mapTapped
        case .didTapCalendar:
            state = .calendarTapped
        case .didTapSend:
            verifyFeedbackForm()
        }
    }

    private func setupRows() {
        let rows: [OrderRow] = [
            .header, .description, .price, .category,
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
        case .price:
            form.price = text
        case .phoneNumber:
            form.phoneNumber = text
        case .date:
            form.date = text
        case .address:
            form.address = text
        case .category:
            form.category = text
        case .paymentWay:
            form.paymentWay = text
        default:
            break
        }
        state = .textFieldChanged(form: form)
    }

    private func verifyFeedbackForm() {
//        guard let description = form.desciption, !description.isEmpty else {
//            state = .error(message: "")
//            return
//        }
//        guard let category = form.category, !category.isEmpty else {
//            state = .error(message: "")
//            return
//        }
//        guard let phoneNumber = form.phoneNumber, !phoneNumber.isEmpty else {
//            state = .error(message: "")
//            return
//        }
//        guard let address = form.address, !address.isEmpty else {
//            state = .error(message: "")
//            return
//        }
//        guard let date = form.date, !date.isEmpty else {
//            state = .error(message: "")
//            return
//        }
        sendForm()
    }

    private func sendForm() {
        state = .loading
//        db.collection("users").document(Auth.auth().currentUser?.email ?? "").getDocument() {[self]
//            (data, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                let data = data
//                form.name = data?["name"] as? String
//                form.phoneNumber = data?["phoneNumber"] as? String
//            }
//
//        }
        db.collection("orders").addDocument(data:
                                                ["name": form.name ?? "",
                                                 "description": form.desciption ?? "",
                                                 "price": form.price ?? "",
                                                 "category":form.category ?? "",
                                                 "phoneNumber": form.phoneNumber ?? "",
                                                 "address": form.address ?? "",
                                                 "date": form.date ?? "",
                                                 "paymentWay": form.paymentWay ?? ""])
        { err in
            self.state = .error(message: err?.localizedDescription)
        }
        state = .formSended
        state = .stopLoading
        state = .textFieldChanged(form: .init())
    }
}
