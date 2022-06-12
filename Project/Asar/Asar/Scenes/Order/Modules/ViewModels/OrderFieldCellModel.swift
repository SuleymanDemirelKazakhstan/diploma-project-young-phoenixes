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
        default:
            return nil
        }
    }
    
    var description: String? {
        switch row {
        case .description:
            return "Напишите подробное описание заказа, чтобы специалист оценил объем работы"
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
            return "Карта"
        case .date:
            return "Календарь"
        default:
            return nil
        }
    }
    
    var placeholder: String? {
        switch row {
        case .description:
            return "Описание заказа"
        case .category:
            return "Категория услуг"
        case .phoneNumber:
            return "Номер телефона"
        case .address:
            return "Укажите точный адрес"
        case .date:
            return "Укажите точную дату"
        case .paymentWay:
            return "Вид оплаты"
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
