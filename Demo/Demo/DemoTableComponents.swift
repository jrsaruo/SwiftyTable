//
//  DemoTableComponents.swift
//  Demo
//
//  Created by Yusaku Nishi on 2018/09/25.
//  Copyright © 2018年 Yusaku Nishi. All rights reserved.
//

import SwiftyTable

extension DemoViewController {
    
    enum Section: Int, TableSection, CaseIterable {
        case profile
        case information
        case collection
        
        var title: String {
            switch self {
            case .profile:
                return "Profile"
            case .information:
                return "Information"
            case .collection:
                return "Collection View Demo"
            }
        }
    }
    
    enum ProfileRow: Int, TableRow, CaseIterable {
        case username
        case email
        case phoneNumber
        
        var title: String {
            switch self {
            case .username:
                return "Username"
            case .email:
                return "Email"
            case .phoneNumber:
                return "Phone Number"
            }
        }
    }
    
    enum InformationRow: Int, TableRow, CaseIterable {
        case help
        case aboutApp
        
        var title: String {
            switch self {
            case .help:
                return "Help"
            case .aboutApp:
                return "About App"
            }
        }
    }
    
}
