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
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.contentInset.left = 15
        collectionView.contentInset.right = 15
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(self.collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.frame = self.contentView.bounds
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
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = #colorLiteral(red: 0.2668387294, green: 0.7654328942, blue: 1, alpha: 1)
        self.layer.cornerRadius = 5
        
        self.contentView.addSubview(self.numberLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.numberLabel.frame = self.contentView.bounds
    }
    
}
