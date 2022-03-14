//
//  TabBarViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 14.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = ProfileViewController()
        let vc2 = MainViewController()
        let vc3 = HomeViewController()
        
        vc1.title = "Profile"
        vc2.title = "Main"
        vc3.title = "Home"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc1)
        let nav3 = UINavigationController(rootViewController: vc1)
        
        nav1.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "profile"), tag: 1)
        nav1.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "folder"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: false)

    }
    



}
