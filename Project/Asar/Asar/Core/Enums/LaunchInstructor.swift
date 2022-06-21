//
//  LaunchInstructor.swift
//  Asar
//
//  Created by Abylbek Khassenov on 25.03.2022.
//

import Foundation

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

enum LaunchInstructor {
    case main
    case auth
    case onboarding
    
    static func configure( tutorialWasShown: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
        switch (tutorialWasShown, isAutorized) {
        case (true, false): return .auth
        case (false, false): return .onboarding
        case (true, true), (false, true): return .main
        }
    }
}
