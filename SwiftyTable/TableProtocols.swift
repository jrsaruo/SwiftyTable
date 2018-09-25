//
//  TableProtocols.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/09/25.
//

// MARK: - TableSection -

/// A type that represents table section.
///
/// Types that conform to the TableSection protocol are typically enumerations assigned integer raw values.
/// **Raw values must correspond to section numbers.**
/// If the type conforms to CaseIterable, you don't need to implement *count* property.
///
/// For example, the Section enumeration declared in this example conforms to TableSection and CaseIterable.
///
///     enum Section: Int, TableSection, CaseIterable {
///         case profile
///         case settings
///     }
///
///     let section0 = Section(0) // section0 == .profile
///     let section1 = Section(1) // section1 == .settings
///
///     func numberOfSections(in tableView: UITableView) -> Int {
///         return Section.count // Returns 2.
///     }
///
public protocol TableSection: TableComponent {}

public extension TableSection {
    
    /// Creates a new instance from the specified section number.
    ///
    /// - Parameter section: table section number to use for the new instance.
    public init(_ section: Int) {
        self.init(value: section)
    }
    
}

// MARK: - TableRow -

/// A type that represents table row. Its raw value must be the same as its row number.
///
/// Types that conform to the TableRow protocol are typically enumerations assigned integer raw values.
/// **Raw values must correspond to row numbers.**
/// If the type conforms to CaseIterable, you don't need to implement *count* property.
///
/// For example, the ProfileRow enumeration declared in this example conforms to TableRow and CaseIterable.
///
///     enum ProfileRow: Int, TableRow, CaseIterable {
///         case username
///         case email
///         case phoneNumber
///     }
///
///     let row0 = ProfileRow(0) // row0 == .username
///     let row1 = ProfileRow(1) // row1 == .email
///     let row2 = ProfileRow(2) // row2 == .phoneNumber
///
///     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
///         return ProfileRow.count // Returns 3.
///     }
///
public protocol TableRow: TableComponent {}

public extension TableRow {
    
    /// Creates a new instance with specified row number.
    ///
    /// - Parameter row: table row number to use for the new instance.
    public init(_ row: Int) {
        self.init(value: row)
    }
    
}

// MARK: - TableComponent -

public protocol TableComponent: RawRepresentable where Self.RawValue == Int {
    
    /// The number of table components. If the type conforms to CaseIterable, this property returns allCases.count by default.
    /// For example, you can use this property in *numberOfSections(in tableView: UITableView) -> Int* method of UITableViewDataSource.
    static var count: Int { get }
    
}

public extension TableComponent where Self: CaseIterable {
    
    @inlinable
    public static var count: Int {
        return self.allCases.count
    }
    
}

private extension TableComponent {
    
    init(value: Int) {
        let component = Self.init(rawValue: value) ?? {
            assertionFailure("Undefined \(Self.self). Please confirm implementation of 'Self.count' property and raw values.")
            return Self.init(rawValue: 0)!
            }()
        self = component
    }
    
}
