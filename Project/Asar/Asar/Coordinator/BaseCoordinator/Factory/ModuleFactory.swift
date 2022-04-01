//
//  ModuleFactory.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import UIKit

final class ModuleFactory {
    func makeLoginViewController() -> UIViewController {
        return TabBarViewController()
    }
}
