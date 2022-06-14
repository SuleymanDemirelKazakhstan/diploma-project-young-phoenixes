//
//  MapViewControler.swift
//  Asar
//
//  Created by Abylbek Khassenov on 13.06.2022.
//

import CoreLocation
import UIKit
import YandexMapsMobile

protocol MapViewNavigationDelegate: AnyObject {
    func backButtonTapped(_ viewController: MapViewControler)
    func actionButtonTapped(_ viewController: MapViewControler)
}

class MapViewControler: UIViewController {
    private weak var navigationDelegate: MapViewNavigationDelegate?
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
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationDelegate?.backButtonTapped(self)
    }
    
    init(store: MapStore, navigationDelegate: MapViewNavigationDelegate) {
        self.store = store
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setupUI() {
        tabBarController?.tabBar.isHidden = true
        Utilities.styleTextField(textField)
        backButton.setImage(Asset.generalClose.image, for: .normal)
        textFieldView.layer.cornerRadius = 16
        textField.placeholder = "Точный адрес"
        titleLabel.text = "Точка назначения"
        actionButton.configureTitle(text: "Подвердить")
        actionButton.delegate = self
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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            mapView.mapWindow.map.move(
                with: YMKCameraPosition(target: .init(latitude: latitude, longitude: longitude), zoom: 15, azimuth: 0, tilt: 0),
                animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 2),
                cameraCallback: nil)
        }
    }
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

extension MapViewControler: BottomActionButtonDelegate {
    func actionButtonDidTap() {
        navigationDelegate?.actionButtonTapped(self)
    }
}
