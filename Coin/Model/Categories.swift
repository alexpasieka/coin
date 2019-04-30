//
//  Categories.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import Foundation

class Category : Codable {
    
    var name : String
    var maxAmount : Float
    var moneyLeftToSpend : Float
    var moneySpent : Float
    
    init(name: String, maxAmount: Float, moneyLeftToSpend: Float, moneySpent: Float) {
        self.name = name
        self.maxAmount = maxAmount
        self.moneyLeftToSpend = moneyLeftToSpend
        self.moneySpent = moneySpent
    }
    
}
