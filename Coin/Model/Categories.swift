//
//  Categories.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

// custom budget category class
class Category : Codable {
    
    // properties
    var name: String
    var maxAmount: Float
    var moneyLeftToSpend: Float
    var moneySpent: Float
    
    // designated initializer
    init(name: String, maxAmount: Float, moneyLeftToSpend: Float, moneySpent: Float) {
        self.name = name
        self.maxAmount = maxAmount
        self.moneyLeftToSpend = moneyLeftToSpend
        self.moneySpent = moneySpent
    }
    
}
