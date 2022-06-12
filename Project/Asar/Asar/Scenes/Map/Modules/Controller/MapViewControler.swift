//
//  MapViewControler.swift
//  Asar
//
//  Created by Abylbek Khassenov on 13.06.2022.
//

import CoreLocation
import UIKit
import YandexMapsMobile

class MapViewControler: UIViewController {
    private let store: MapStore
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    private lazy var mapView: YMKMapView = {
        let view = YMKMapView()
        view.mapWindow.map.addInputListener(with: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var placemark: YMKMapObject? {
        willSet {
            if let placemark = placemark {
                mapView.mapWindow.map.mapObjects.remove(with: placemark)
            }
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var actionButton: BottomActionButton!
    
    init(store: MapStore) {
        self.store = store
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tabBarController?.tabBar.isHidden = true
        Utilities.styleTextField(textField)
        textField.placeholder = "Точный адрес"
        backButton.setImage(Asset.generalClose.image, for: .normal)
        titleLabel.text = "Точка назначения"
        textFieldView.layer.cornerRadius = 16
        actionButton.configureTitle(text: "Подвердить")
        setupMapView()
        setupUserLocationLayer()
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        view.sendSubviewToBack(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -155)
        ])
    }
    
    private func setupUserLocationLayer() {
        let mapKit = YMKMapKit.sharedInstance()
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
        userLocationLayer.setObjectListenerWith(self)
    }
    
    private func setupObservers() {
//        store.$state.observe(self) { vc, state in
//            guard let state = state else { return }
//            switch state {
//            }
//        }
    }
}

extension MapViewControler: CLLocationManagerDelegate {
    
}

extension MapViewControler: YMKMapInputListener {
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        
    }
    
    func onMapLongTap(with map: YMKMap, point: YMKPoint) {
        
    }
}

extension MapViewControler: YMKUserLocationObjectListener {
    func onObjectAdded(with view: YMKUserLocationView) {
    }
    
    func onObjectRemoved(with view: YMKUserLocationView) {
    }
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
    }
}
