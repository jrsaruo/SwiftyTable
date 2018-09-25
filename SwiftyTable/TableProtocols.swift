//
//  TableProtocols.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/09/25.
//

// MARK: - TableSection -

public protocol TableSection: TableComponent {}

public extension TableSection {
    
    public init(_ section: Int) {
        self.init(value: section)
    }
    
}

// MARK: - TableRow -

public protocol TableRow: TableComponent {}

public extension TableRow {
    
    public init(_ row: Int) {
        self.init(value: row)
    }
    
}

// MARK: - TableComponent -

public protocol TableComponent: RawRepresentable where Self.RawValue == Int {
    static var count: Int { get }
}

public extension TableComponent where Self: CaseIterable {
    
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
