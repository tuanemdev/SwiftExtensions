//
//  File.swift
//  SwiftExtensions
//

import Foundation

public extension String {
    subscript(index: Int) -> Character {
        self[self.index(startIndex, offsetBy: index)]
    }
}
