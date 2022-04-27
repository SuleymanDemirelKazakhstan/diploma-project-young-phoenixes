//
//  Fonts.swift
//  Asar
//
//  Created by Abylbek Khassenov on 18.04.2022.
//

import UIKit

enum Font: String, CaseIterable {
    case bold = "SFProDisplay-Bold"
    case regular = "SFProDisplay-Regular"
}

extension UIFont {
    convenience init(type: Font, size: CGFloat) {
        self.init(name: type.rawValue, size: size)!
    }
}

enum Fonts {
    static let heading1 = UIFont(type: .bold, size: 40)
    static let heading2Bold = UIFont(type: .bold, size: 48)
    static let heading3 = UIFont(type: .bold, size: 28)
    static let heading4 = UIFont(type: .bold, size: 20)
    static let paragraphLargeRegular = UIFont(type: .regular, size: 18)
    static let paragraphBold = UIFont(type: .bold, size: 16)
    static let paragraphRegular = UIFont(type: .regular, size: 16)
    static let paragraphSmallBold = UIFont(type: .bold, size: 14)
    static let paragraphSmallRegular = UIFont(type: .regular, size: 14)
    static let captionRegular = UIFont(type: .regular, size: 12)
    static let button = UIFont(type: .bold, size: 14)
    static let sfProSmall = UIFont.systemFont(ofSize: 10)
    static let sfProRegular = UIFont.systemFont(ofSize: 14)

    static func register() {
        let bundle = Bundle(for: BundleToken.self)
        for font in Font.allCases {
            if let cfURL = bundle.url(forResource: font.rawValue, withExtension: "ttf") {
                CTFontManagerRegisterFontsForURL(cfURL as CFURL, .process, nil)
            } else {
                assertionFailure("Could not find font:\(font.rawValue) in bundle:\(bundle)")
            }
        }
    }
}

private final class BundleToken {}
