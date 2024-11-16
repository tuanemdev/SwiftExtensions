//
//  UIColor+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UIColor {
    // MARK: - HEX
    convenience init?(hex: String) {
        var hexString: String = hex
        if hex.hasPrefix("#") {
            hexString = String(hexString.dropFirst())
        }
        switch hexString.count {
        case 6:
            hexString.append("FF")
        case 8:
            break
        default:
            return nil
        }
        
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber)
        else { return nil }
        
        let red = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
        let green = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
        let blue = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
        let alpha = CGFloat((hexNumber & 0x000000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // MARK: - HSL
    convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1.0) {
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        let newSaturation: CGFloat
        if brightness == 0 {
            newSaturation = 0.0
        } else {
            newSaturation = 2 * (1 - lightness / brightness)
        }
        self.init(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
    }
}

public extension UIColor {
    @discardableResult
    func getHex(_ hex: UnsafeMutablePointer<String>?) -> Bool {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        guard self.getRed(&r, green: &g, blue: &b, alpha: &a)
        else { return false }
        
        let hexString: String = String(format: "%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        hex?.pointee = hexString
        return true
    }
    
    @discardableResult
    func getHue(
        _ hue: UnsafeMutablePointer<CGFloat>?,
        saturation: UnsafeMutablePointer<CGFloat>?,
        lightness: UnsafeMutablePointer<CGFloat>?,
        alpha: UnsafeMutablePointer<CGFloat>?
    ) -> Bool {
        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        guard self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        else { return false }
        
        let l = b * (1 - s / 2)
        let new_s: CGFloat
        if l == 0 || l == 1 {
            new_s = 0
        } else {
            new_s = (b - l) / min(l, 1 - l)
        }
        hue?.pointee = h
        saturation?.pointee = new_s
        lightness?.pointee = l
        alpha?.pointee = a
        return true
    }
}
