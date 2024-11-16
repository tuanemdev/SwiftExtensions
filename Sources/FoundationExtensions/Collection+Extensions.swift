//
//  Collection+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Collection {
    var isNotEmpty: Bool { !isEmpty }
}

public extension RandomAccessCollection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
