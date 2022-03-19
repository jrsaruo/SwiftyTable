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
    @inlinable
    func register<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Returns a reusable collection-view cell object for the specified type.
    ///
    /// To use this method, you need to register cell by using `register(_ cellClass:)` method in advance.
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
    func dequeueReusableCell<Cell: UICollectionViewCell>(of cellClass: Cell.Type,
                                                         for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            preconditionFailure("\(Cell.self) is not registered. Please confirm cell registration.")
        }
        return cell
    }
    
    // MARK: - UICollectionViewCell
    
    /// Registers a class for use in creating supplementary views for the collection view.
    ///
    /// - Parameters:
    ///   - viewClass: The class to use for the supplementary view.
    ///   - elementKind: The kind of supplementary view to create. This value is defined by the layout object.
    @inlinable
    func register<View: UICollectionReusableView>(_ viewClass: View.Type,
                                                  forSupplementaryViewOf elementKind: ElementKind) {
        register(viewClass,
                 forSupplementaryViewOfKind: elementKind.rawValue,
                 withReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Returns a reusable supplementary view located by its kind.
    ///
    /// - Parameters:
    ///   - viewClass: The class to use for the supplementary view.
    ///   - elementKind: The kind of supplementary view to retrieve. This value is defined by the layout object.
    ///   - indexPath: The index path specifying the location of the supplementary view in the collection view.
    func dequeueReusableSupplementaryView<View: UICollectionReusableView>(_ viewClass: View.Type,
                                                                          of elementKind: ElementKind,
                                                                          for indexPath: IndexPath) -> View {
        let view = dequeueReusableSupplementaryView(ofKind: elementKind.rawValue,
                                                    withReuseIdentifier: viewClass.reuseIdentifier,
                                                    for: indexPath)
        guard let supplementaryView = view as? View else {
            preconditionFailure("\(View.self) is not registered. Please confirm supplementary-view registration.")
        }
        return supplementaryView
    }
}

public extension UICollectionView {
    
    struct ElementKind: RawRepresentable {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let sectionHeader = ElementKind(rawValue: UICollectionView.elementKindSectionHeader)
        public static let sectionFooter = ElementKind(rawValue: UICollectionView.elementKindSectionFooter)
    }
}
