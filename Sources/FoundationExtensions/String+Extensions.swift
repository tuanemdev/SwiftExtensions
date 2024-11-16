//
//  String+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension String {
    subscript(index: Int) -> Character {
        self[self.index(startIndex, offsetBy: index)]
    }
    
    subscript(safe index: Int) -> Character? {
        guard index >= 0, index < count else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    var rawRepresentable: Data {
        Data(self.utf8)
    }
    
    var base64Encoded: String {
        self.rawRepresentable.base64EncodedString()
    }
    
    func localized(tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
    func format(_ arguments: any CVarArg...) -> String {
        return String(format: self, arguments: arguments)
    }
}
