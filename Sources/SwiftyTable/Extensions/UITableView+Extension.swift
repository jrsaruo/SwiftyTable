//
//  UITableView+Extension.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/10/28.
//

import UIKit

public extension UITableView {
    
    // MARK: - UITableViewCell
    
    /// Registers a class for use in creating new table cells.
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Returns a reusable table-view cell object for the specified type and adds it to the table.
    ///
    /// To use this method, you need to register cell by using `register(_ cellClass:)` method in advance.
    ///
    ///     class CustomCell: UITableViewCell {
    ///         var someProperty: String?
    ///     }
    ///
    ///     let tableView = UITableView()
    ///     tableView.register(CustomCell.self) // No need to define reuse identifier.
    ///
    ///     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    ///         let cell = tableView.dequeueReusableCell(of: CustomCell.self, for: indexPath)
    ///         cell.someProperty = "No need to use 'as! CustomCell'"
    ///         return cell
    ///     }
    ///
    func dequeueReusableCell<Cell: UITableViewCell>(of cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            preconditionFailure("\(Cell.self) is not registered. Please confirm cell registration.")
        }
        return cell
    }
    
    // MARK: - HeaderFooter
    
    /// Registers a class for use in creating new table header or footer views.
    func register<HeaderFooter: UITableViewHeaderFooterView>(_ headerFooterClass: HeaderFooter.Type) {
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier: headerFooterClass.reuseIdentifier)
    }
    
    /// Returns a reusable header or footer view for the specified type.
    ///
    /// To use this method, you need to register header or footer view by using `register(_ headerFooterClass:)` method in advance.
    func dequeueReusableHeaderFooterView<HeaderFooter: UITableViewHeaderFooterView>(of headerFooterClass: HeaderFooter.Type) -> HeaderFooter {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: headerFooterClass.reuseIdentifier),
              let headerFooter = view as? HeaderFooter else {
            preconditionFailure("\(HeaderFooter.self) is not registered. Please confirm header/footer registration.")
        }
        return headerFooter
    }
    
}
