//
//  Months.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import Foundation

class Month : Codable {
    
    var name : String
    var report : [Category]
    
    init(name: String, report: [Category]) {
        self.name = name
        self.report = report
    }
    
}
