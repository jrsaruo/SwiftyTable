//
//  Reusable.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/10/28.
//

import UIKit

/// A type that provides reusaIdentifier.
///
/// UITableViewCell, UITableHeaderFooterView and UICollectionViewCell conform to this protocol.
/// It enables to omit reuse identifier definition for cells.
///
///     class CustomCell: UITableViewCell { // UITableViewCell conforms to Reusable.
///         var someProperty: String?
///     }
///
///     let tableView = UITableView()
///     tableView.register(UITableViewCell.self)
///     tableView.register(CustomCell.self) // No need to define reuse identifier.
///
///     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
///         let cell = tableView.dequeueReusableCell(of: CustomCell.self, for: indexPath)
///         cell.someProperty = "No need to use 'as! CustomCell'"
///         return cell
///     }
///
public protocol Reusable: class {
    
    /// A string identifying the object to be reused. Default value is class name with module prefix.
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self) // class name with module prefix
    }
    
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}

extension UICollectionReusableView: Reusable {}
