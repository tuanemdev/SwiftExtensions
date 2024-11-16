//
//  Array+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Array where Element: Hashable {
    func removeDuplicates() -> Self {
        var seen = Set<Element>()
        return self.filter { seen.insert($0).inserted }
    }
}
