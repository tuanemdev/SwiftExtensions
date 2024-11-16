//
//  UIFont+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UIFont {
    static func printFonts() {
        UIFont
            .familyNames
            .forEach { familyName in
                print("\(familyName)")
                UIFont
                    .fontNames(forFamilyName: familyName)
                    .enumerated()
                    .forEach { index, fontName in
                        print("\t\(index). \(fontName)")
                    }
                print("\n======================================\n")
            }
    }
    
    static func customFont(name: String, size: CGFloat = UIFont.systemFontSize, textStyle: UIFont.TextStyle = .body) -> UIFont {
        let customFont = UIFont(name: name, size: size)!
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: customFont)
        // adjustsFontForContentSizeCategory = true
    }
}
