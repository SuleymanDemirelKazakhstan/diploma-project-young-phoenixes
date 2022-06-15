//
//  OrderFieldCellModel.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

struct OrderFieldCellModel {
    var text: String? {
        switch row {
        case .description:
            return form.desciption
        case .category:
            return form.category
        case .phoneNumber:
            return form.phoneNumber
        case .paymentWay:
            return form.paymentWay
        case .date:
            return form.date
        case .address:
            return form.address
        default:
            return nil
        }
    }
    
    var description: String? {
        switch row {
        case .description:
            return L10n.orderSubtitle
        default:
            return nil
        }
    }
    
    var rightViewMode: UITextField.ViewMode {
        switch row {
        case .category, .address, .paymentWay, .date:
            return .always
        default:
            return .never
        }
    }
    
    var rightViewText: String? {
        switch row {
        case .address:
            return L10n.orderAddressButton
        case .date:
            return L10n.orderDataButton
        default:
            return nil
        }
    }
    
    var placeholder: String? {
        switch row {
        case .description:
            return L10n.orderDetailOrderPlaceholder
        case .category:
            return L10n.orderCategoryPlaceholder
        case .phoneNumber:
            return L10n.orderTelephoneNumberPlaceholder
        case .address:
            return L10n.orderAddressPlaceholder
        case .date:
            return L10n.orderDataPlaceholder
        case .paymentWay:
            return L10n.orderPaymentPlaceholder
        default:
            return nil
        }
    }
    
    let row: OrderRow
    private let form: OrderForm
    
    init(row: OrderRow, form: OrderForm) {
        self.row = row
        self.form = form
    }
}
