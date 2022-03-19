//
//  DemoCells.swift
//  Demo
//
//  Created by Yusaku Nishi on 2018/10/28.
//  Copyright © 2018 Yusaku Nishi. All rights reserved.
//

import UIKit

// MARK: - DemoTableViewCell -

final class DemoTableViewCell: UITableViewCell {
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 80, height: 80)
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInsetReference = .fromLayoutMargins
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.preservesSuperviewLayoutMargins = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        contentView.addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = contentView.bounds
    }
    
}

// MARK: - DemoCollectionViewCell -

final class DemoCollectionViewCell: UICollectionViewCell {
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        backgroundColor = #colorLiteral(red: 0.2668387294, green: 0.7654328942, blue: 1, alpha: 1)
        layer.cornerRadius = 5
        
        contentView.addSubview(numberLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        numberLabel.frame = contentView.bounds
    }
    
}
