//
//  Optional+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension Optional {
    func unwrapOr(_ defaultValue: Wrapped) -> Wrapped {
        self ?? defaultValue
    }
    
    func unwrapOrThrow(_ error: any Error) throws -> Wrapped {
        guard let self else { throw error }
        return self
    }
}

public extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
