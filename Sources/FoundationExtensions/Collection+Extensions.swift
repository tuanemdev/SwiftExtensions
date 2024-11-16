//
//  Collection+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Collection {
    var isNotEmpty: Bool { !isEmpty }
}

public extension RandomAccessCollection where Index: Hashable {
    subscript(safe index: Index) -> Element? {
        Set(indices).contains(index) ? self[index] : nil
    }
}
