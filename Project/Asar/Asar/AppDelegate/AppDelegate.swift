//
//  AppDelegate.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit
import Firebase
//import YandexMapsMobile

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let MAPKIT_API_KEY = "b19693b4-a600-4e57-8365-871fd2af9d9b"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
//        YMKMapKit.setApiKey(MAPKIT_API_KEY)
////        YMKMapKit.setLocale("en_US")
//        YMKMapKit.sharedInstance()
        return true
    }
    
}

