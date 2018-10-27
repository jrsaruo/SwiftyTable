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
        return tableView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self)
        self.tableView.register(DemoTableViewCell.self)
        
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
        case .collection:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(section).title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(indexPath.section) {
        case .profile:
            let cell = tableView.dequeueReusableCell(of: UITableViewCell.self, for: indexPath)
            cell.textLabel?.text = ProfileRow(indexPath.row).title
            return cell
        case .information:
            let cell = tableView.dequeueReusableCell(of: UITableViewCell.self, for: indexPath)
            cell.textLabel?.text = InformationRow(indexPath.row).title
            return cell
        case .collection:
            let demoCell = tableView.dequeueReusableCell(of: DemoTableViewCell.self, for: indexPath)
            demoCell.collectionView.dataSource = self
            demoCell.collectionView.register(DemoCollectionViewCell.self)
            return demoCell
        }
    }
    
}

// MARK: - UITableViewDelegate -

extension DemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(indexPath.section) {
        case .profile, .information:
            return 50
        case .collection:
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource -

extension DemoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let demoCell = collectionView.dequeueReusableCell(of: DemoCollectionViewCell.self, for: indexPath)
        demoCell.numberLabel.text = String(indexPath.item)
        return demoCell
    }
    
}
