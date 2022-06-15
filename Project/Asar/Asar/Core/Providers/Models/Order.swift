//
//  Order.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.06.2022.
//

import Foundation

struct Order: Codable, Identifiable {
    var id: String = UUID().uuidString
    var description: String?
    var category: String?
    var phoneNumber: String?
    var address: String?
    var date: String?
    var paymentWay: String?
}
