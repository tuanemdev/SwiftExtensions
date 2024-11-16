//
//  Array+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Array where Element: Hashable {
    func removeDuplicates() -> (uniqueElements: [Element], removedElements: [Element]) {
        var seen = Set<Element>()
        var uniqueElements = [Element]()
        var removedElements = [Element]()
        
        self.forEach {
            if seen.insert($0).inserted {
                uniqueElements.append($0)
            } else {
                removedElements.append($0)
            }
        }
        
        return (uniqueElements, removedElements)
    }
}
