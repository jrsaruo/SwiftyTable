//
//  DemoViewController.swift
//  Demo
//
//  Created by Yusaku Nishi on 2018/09/25.
//  Copyright © 2018年 Yusaku Nishi. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.rowHeight = 50
        return tableView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self)
        
        setupViews()
    }
    
    private func setupViews() {
        self.title = "SwiftyTable Demo"
        self.view.backgroundColor = .white
        
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
    }
    
}

// MARK: - UITableViewDataSource -

extension DemoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(section) {
        case .profile:
            return ProfileRow.count
        case .information:
            return InformationRow.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(section).title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowTitle: String
        switch Section(indexPath.section) {
        case .profile:
            rowTitle = ProfileRow(indexPath.row).title
        case .information:
            rowTitle = InformationRow(indexPath.row).title
        }
        
        let cell = tableView.dequeueReusableCell(of: UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = rowTitle
        return cell
    }
    
}

// MARK: - UITableViewDelegate -

extension DemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
