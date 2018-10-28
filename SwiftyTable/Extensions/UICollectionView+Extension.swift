//
//  UICollectionView+Extension.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/10/28.
//

import UIKit

public extension UICollectionView {
    
    // MARK: - UICollectionViewCell
    
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
    
    // MARK: - UICollectionViewCell
    
    /// Registers a class for use in creating supplementary views for the collection view.
    ///
    /// - Parameters:
    ///   - viewClass: The class to use for the supplementary view.
    ///   - elementKind: The kind of supplementary view to create. This value is defined by the layout object.
    public func register<View: UICollectionReusableView>(_ viewClass: View.Type,
                                                         forSupplementaryViewOfKind elementKind: String) {
        register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Returns a reusable supplementary view located by its kind.
    ///
    /// - Parameters:
    ///   - viewClass: The class to use for the supplementary view.
    ///   - elementKind: The kind of supplementary view to retrieve. This value is defined by the layout object.
    ///   - indexPath: The index path specifying the location of the supplementary view in the collection view.
    public func dequeueReusableSupplementaryView<View: UICollectionReusableView>(_ viewClass: View.Type,
                                                                                 ofKind elementKind: String,
                                                                                 for indexPath: IndexPath) -> View {
        let view = dequeueReusableSupplementaryView(ofKind: elementKind,
                                                    withReuseIdentifier: viewClass.reuseIdentifier,
                                                    for: indexPath)
        guard let supplementaryView = view as? View else {
            assertionFailure("\(View.self) is not registered. Please confirm supplementary-view registration.")
            register(viewClass, forSupplementaryViewOfKind: viewClass.reuseIdentifier)
            return viewClass.init()
        }
        return supplementaryView
    }
    
}
