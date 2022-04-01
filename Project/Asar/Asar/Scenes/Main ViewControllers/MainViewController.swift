//
//  MainViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 01.04.2022.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {

    let search: UISearchController = {
        let vc = UISearchController()
        vc.searchBar.placeholder = "Искать"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
}
