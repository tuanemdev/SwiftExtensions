//
//  UIImage+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UIImage {
    convenience init?(base64Encoded: String) {
        guard let imageData = Data(base64Encoded: base64Encoded, options: .ignoreUnknownCharacters)
        else { return nil }
        self.init(data: imageData)
    }
    
    func base64Encoded(compressionQuality: CGFloat = 1.0) -> String? {
        guard let imageData = self.jpegData(compressionQuality: compressionQuality)
        else { return nil }
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
}
