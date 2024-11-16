//
//  UICollectionView+Extensions.swift
//  SwiftExtensions
//

public extension UICollectionView {
    func registerCell(type: UICollectionViewCell.Type) {
        register(UINib(nibName: type.identifier, bundle: nil), forCellWithReuseIdentifier: type.identifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! T
    }
}

public extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
