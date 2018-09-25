//
//  IndexPath+Extension.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/09/26.
//

import Foundation

public extension IndexPath {
    
    @inlinable
    public init<Row: TableRow, Section: TableSection>(row: Row, section: Section) {
        self.init(row: row.rawValue, section: section.rawValue)
    }
    
    @inlinable
    public init<Section: TableSection>(row: Int, section: Section) {
        self.init(row: row, section: section.rawValue)
    }
    
    @inlinable
    public init<Row: TableRow>(row: Row, section: Int) {
        self.init(row: row.rawValue, section: section)
    }
    
}
