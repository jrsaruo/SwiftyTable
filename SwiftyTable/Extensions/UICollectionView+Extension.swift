//
//  UICollectionView+Extension.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/10/28.
//

import UIKit

public extension UICollectionView {
    
    /// Register a class for use in creating new collection view cells.
    public func register<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Returns a reusable collection-view cell object for the specified type.
    ///
    /// To use this method, you need to register cell by using register(_ cellClass:) method.
    ///
    ///     class CustomCell: UICollectionViewCell {
    ///         var someProperty: String?
    ///     }
    ///
    ///     let collectionView = UICollectionView()
    ///     collectionView.register(CustomCell.self) // No need to define reuse identifier.
    ///
    ///     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    ///         let cell = collectionView.dequeueReusableCell(of: CustomCell.self, for: indexPath)
    ///         cell.someProperty = "No need to use 'as! CustomCell'"
    ///         return cell
    ///     }
    ///
    public func dequeueReusableCell<Cell: UICollectionViewCell>(of cellClass: Cell.Type,
                                                                for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("\(Cell.self) is not registered. Please confirm cell registration.")
            register(cellClass.self)
            return cellClass.init()
        }
        return cell
    }
    
}
