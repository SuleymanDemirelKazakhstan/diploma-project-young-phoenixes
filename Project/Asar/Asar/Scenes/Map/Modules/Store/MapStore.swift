//
//  MapStore.swift
//  Asar
//
//  Created by Abylbek Khassenov on 13.06.2022.
//

import CoreLocation
import UIKit

final class MapStore {
    enum Action {
        case didLoadView
        case didUpdateLocation(location: CLLocation)
        case didTapConfirm
    }

    enum State {
        
    }
    
    init() {
        
    }
    
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
//            setupFilters()
            break
        case .didTapConfirm:
//            if let city = dataModel.city {
//                storage.selectedCity = city
//                storage.selectedRegion = city.region
//                state = .cityUpdated(city: city)
//            } else if let region = dataModel.region {
//                state = .regionUpdated(region: region)
//            }
            break
        case let .didUpdateLocation(location):
            break
        }
    }
    
    private func getGeoLocation() {
        
    }
}
