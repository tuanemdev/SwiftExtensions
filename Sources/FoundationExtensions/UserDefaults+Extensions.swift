//
//  UserDefaults+Extensions.swift
//  SwiftExtensions
//

import Foundation

public extension UserDefaults {
    func value<T>(_ type: T.Type, forKey defaultName: String) -> T? {
        if let value = object(forKey: defaultName) as? T {
            return value
        } else {
            return nil
        }
    }
    
    func getObject<T: Codable>(_ type: T.Type, forKey defaultName: String) -> T? {
        guard let data = data(forKey: defaultName) else { return nil }
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            return nil
        }
    }
    
    func setObject<T: Codable>(_ object: T, forKey defaultName: String) throw {
        let data = try JSONEncoder().encode(object)
        set(data, forKey: defaultName)
    }
}
