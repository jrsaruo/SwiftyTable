//
//  DemoViewController.swift
//  Demo
//
//  Created by Yusaku Nishi on 2018/09/25.
//  Copyright © 2018年 Yusaku Nishi. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        self.title = "SwiftyTable Demo"
        self.view.backgroundColor = .white
    }
    
}
