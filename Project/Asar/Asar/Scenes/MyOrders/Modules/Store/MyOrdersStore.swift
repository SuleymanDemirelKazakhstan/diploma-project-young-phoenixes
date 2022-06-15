//
//  MyOrdersViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 15.06.2022.
//

import UIKit
import FirebaseFirestore

final class MyOrdersStore {
    enum Action {
        case didLoadView
        case didTapOrder
    }
    
    enum State {
        case ordersLoaded
        case orderTapped
    }
    
    
    private var db = Firestore.firestore()
    @Observable private(set) var state: State?
    var orders: [Order] = []
    
    init() {}
    
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            getOrders()
        case .didTapOrder:
            break
        }
    }
    
    private func getOrders() {
        db.collection("order").document("abylbek39@gmail.com").collection("orders").getDocuments() { [self]
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let description = data["description"] as? String
                        let category = data["category"] as? String
                        let phoneNumber = data["phoneNumber"] as? String
                        let address = data["address"] as? String
                        let date = data["date"] as? String
                        let paymentWay = data["paymentWay"] as? String
                        self.orders.append(.init(id: document.documentID,
                                            description: description,
                                            category: category,
                                            phoneNumber: phoneNumber,
                                            address: address,
                                            date: date,
                                            paymentWay: paymentWay))
                        self.state = .ordersLoaded
                    }
                }
        }
    }
}
