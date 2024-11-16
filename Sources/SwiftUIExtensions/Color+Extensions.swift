//
//  Color+Extensions.swift
//  SwiftExtensions
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension Color {
    // MARK: - HEX
    init?(hex: String) {
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
        
        let red = Double((hexNumber & 0xFF000000) >> 24) / 255.0
        let green = Double((hexNumber & 0x00FF0000) >> 16) / 255.0
        let blue = Double((hexNumber & 0x0000FF00) >> 8) / 255.0
        let alpha = Double((hexNumber & 0x000000FF)) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    // MARK: - HSL
    init(hue: Double, saturation: Double, lightness: Double, opacity: Double = 1.0) {
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        let newSaturation: Double
        if brightness == 0 {
            newSaturation = 0.0
        } else {
            newSaturation = 2 * (1 - lightness / brightness)
        }
        self.init(hue: hue, saturation: newSaturation, brightness: brightness, opacity: opacity)
    }
}
