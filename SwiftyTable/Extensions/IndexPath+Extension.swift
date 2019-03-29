//
//  IndexPath+Extension.swift
//  SwiftyTable
//
//  Created by Yusaku Nishi on 2018/09/26.
//

import Foundation

public extension IndexPath {
    
    @inlinable
    init<Row: TableRow, Section: TableSection>(row: Row, section: Section) {
        self.init(row: row.rawValue, section: section.rawValue)
    }
    
    @inlinable
    init<Section: TableSection>(row: Int, section: Section) {
        self.init(row: row, section: section.rawValue)
    }
    
    @inlinable
    init<Row: TableRow>(row: Row, section: Int) {
        self.init(row: row.rawValue, section: section)
    }
    
}
