//
//  ContainerController.swift
//  Asar
//
//  Created by Abylbek Khassenov on 30.04.2022.
//

import UIKit

class ContainerController: UITabBarController {
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func setup() {
        tabBar.isTranslucent = true
        updateColors()
    }

    private func updateColors() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
