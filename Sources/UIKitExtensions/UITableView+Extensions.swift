//
//  UITableView+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UITableView {
    func registerCell(type: UITableViewCell.Type) {
        register(UINib(nibName: type.identifier, bundle: nil), forCellReuseIdentifier: type.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(type: UITableViewCell.Type) -> T {
        dequeueReusableCell(withIdentifier: type.identifier) as! T
    }
    
    func dequeueCell<T: UITableViewCell>(type: UITableViewCell.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}
