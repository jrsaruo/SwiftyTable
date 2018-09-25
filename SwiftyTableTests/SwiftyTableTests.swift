//
//  SwiftyTableTests.swift
//  SwiftyTableTests
//
//  Created by Yusaku Nishi on 2018/09/25.
//

import XCTest
@testable import SwiftyTable

class SwiftyTableTests: XCTestCase {
    
    private enum Section: Int, TableSection, CaseIterable {
        case zero
        case one
        case two
    }
    
    private enum Row: Int, TableRow, CaseIterable {
        case zero
        case one
        case two
        case three
    }
    
    // MARK: -
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: -
    
    func testTableSection() {
        XCTAssertEqual(Section.zero.rawValue, 0)
        XCTAssertEqual(Section.one.rawValue, 1)
        XCTAssertEqual(Section.two.rawValue, 2)
        
        XCTAssertEqual(Section.count, 3)
        
        XCTAssertEqual(Section(0), .zero)
        XCTAssertEqual(Section(1), .one)
        XCTAssertEqual(Section(2), .two)
    }
    
    func testTableRow() {
        XCTAssertEqual(Row.zero.rawValue, 0)
        XCTAssertEqual(Row.one.rawValue, 1)
        XCTAssertEqual(Row.two.rawValue, 2)
        XCTAssertEqual(Row.three.rawValue, 3)
        
        XCTAssertEqual(Row.count, 4)
        
        XCTAssertEqual(Row(0), .zero)
        XCTAssertEqual(Row(1), .one)
        XCTAssertEqual(Row(2), .two)
        XCTAssertEqual(Row(3), .three)
    }
    
    func testIndexPathInitialization() {
        XCTAssertEqual(IndexPath(row: 1, section: 2), IndexPath(row: 1, section: Section.two))
        XCTAssertEqual(IndexPath(row: 1, section: 2), IndexPath(row: Row.one, section: 2))
        XCTAssertEqual(IndexPath(row: 1, section: 2), IndexPath(row: Row.one, section: Section.two))
    }
    
}
