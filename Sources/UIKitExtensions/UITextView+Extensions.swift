//
//  UITextView+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UITextView {
    func setPlaceholder(_ placeholder: String, attributes attrs: [NSAttributedString.Key : Any]? = nil) {
        let selector = NSSelectorFromString("setAttributedPlaceholder:")
        guard responds(to: selector) else { return }
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attrs)
        perform(selector, with: attributedPlaceholder)
    }
}
