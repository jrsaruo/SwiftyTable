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
        case zero, one, two
    }
    
    private enum Row: Int, TableRow, CaseIterable {
        case zero, one, two, three
    }
    
    private enum Item: Int, CollectionItem, CaseIterable {
        case zero, one, two, three
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
        
        XCTAssertEqual(IndexPath(item: 1, section: 2), IndexPath(item: 1, section: Section.two))
        XCTAssertEqual(IndexPath(item: 1, section: 2), IndexPath(item: Item.one, section: 2))
        XCTAssertEqual(IndexPath(item: 1, section: 2), IndexPath(item: Item.one, section: Section.two))
    }
    
    // MARK: -
    
    func testRegisterAndReuse() {
        XCTContext.runActivity(named: "UITableView") { _ in
            let tableView = UITableView()
            XCTContext.runActivity(named: "Reuse cells") { _ in
                tableView.register(UITableViewCell.self)
                let _ = tableView.dequeueReusableCell(of: UITableViewCell.self,
                                                      for: IndexPath(row: 0, section: 0))
            }
            XCTContext.runActivity(named: "Reuse header/footer views") { _ in
                tableView.register(UITableViewHeaderFooterView.self)
                let _ = tableView.dequeueReusableHeaderFooterView(of: UITableViewHeaderFooterView.self)
            }
        }
        XCTContext.runActivity(named: "UICollectionView") { _ in
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
            XCTContext.runActivity(named: "Reuse cells") { _ in
                collectionView.register(UICollectionViewCell.self)
                let _ = collectionView.dequeueReusableCell(of: UICollectionViewCell.self,
                                                           for: IndexPath(row: 0, section: 0))
            }
            XCTContext.runActivity(named: "Reuse supplementary views") { _ in
                collectionView.register(UICollectionReusableView.self,
                                        forSupplementaryViewOf: .sectionHeader)
                let _ = collectionView.dequeueReusableSupplementaryView(UICollectionReusableView.self,
                                                                        of: .sectionHeader,
                                                                        for: IndexPath(row: 0, section: 0))
            }
        }
    }
}
