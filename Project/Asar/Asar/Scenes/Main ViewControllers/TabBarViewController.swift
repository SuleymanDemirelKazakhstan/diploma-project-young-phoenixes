//
//  TabBarViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 01.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = MainViewController()
        let vc2 = OrderViewController()
        let vc3 = MyOrdersViewController()
        let vc4 = ProfileViewController()
        
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "star"), tag:1)
        nav2.tabBarItem = UITabBarItem(title: "Заказать", image: UIImage(systemName: "star"), tag:1)
        nav3.tabBarItem = UITabBarItem(title: "Мои Заказы", image: UIImage(systemName: "star"), tag:1)
        nav4.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "star"), tag:1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)

    }
    
}
