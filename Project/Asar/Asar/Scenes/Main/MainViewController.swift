//
//  MainViewController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 18.04.2022.
//

import UIKit

enum MenuOption: Int {
    case home = 0, order, myOrders, profile
}

private enum Constants {
    static let menuProgressFromTipThreshold: CGFloat = 44
}

class MainViewController: UIViewController {
    private let containerController: ContainerController
    private var selectedIndex: Int
    private var selectedOption: MenuOption?
    
    init(containerController: ContainerController) {
        self.containerController = containerController
        selectedIndex = 1
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerController()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateTraitCollectionOfContainerController()
    }

    func updateContainerSelectedItem(selectedIndex: Int? = nil) {
        if let selectedIndex = selectedIndex {
            self.selectedIndex = selectedIndex
            selectedOption = MenuOption(rawValue: selectedIndex)
        }
        containerController.selectedIndex = self.selectedIndex
    }

    private func setupContainerController() {
        addChild(containerController)
        view.addSubview(containerController.view)
        containerController.didMove(toParent: self)
        updateTraitCollectionOfContainerController()
    }

    private func updateTraitCollectionOfContainerController() {
        let traitCollection = UITraitCollection(traitsFrom: [
            self.traitCollection,
            UITraitCollection(horizontalSizeClass: .regular)
        ])
        setOverrideTraitCollection(traitCollection, forChild: containerController)
    }
}

// MARK: - UITabBarControllerDelegate

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = tabBarController.viewControllers?.firstIndex(of: viewController) else { return false }
        return updateMenuOption(index: index)
    }

    private func updateMenuOption(index: Int) -> Bool {
        guard let menuOption = MenuOption(rawValue: index) else { return false }
        switch menuOption {
        case .home, .order, .myOrders, .profile:
            containerController.selectedIndex = index
            return true
        }
    }
}
