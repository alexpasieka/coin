//
//  Months.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

// custom budget month class
class Month : Codable {
    
    // properties
    var name: String
    var report: [Category]
    
    // designated initializer
    init(name: String, report: [Category]) {
        self.name = name
        self.report = report
    }
    
}
