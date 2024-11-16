//
//  Bool+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Bool {
    var intValue: Int {
        self ? 1 : 0
    }
    
    var stringValue: String {
        self ? "true" : "false"
    }
}
