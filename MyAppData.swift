//
//  MyAppData.swift
//  Coin
//
//  Created by Alex Pasieka on 4/23/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import Foundation

class MyAppData {
    
    static let shared = MyAppData()
    
    let lastActivityDateKey : String = "lastActivityDateKey"
    var lastActivityDate : Date = Date() {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(lastActivityDate, forKey: lastActivityDateKey)
        }
    }
    
    let categoriesKey : String = "categoriesKey"
    var categories : [Category] = [Category]() {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(categories, forKey: categoriesKey)
        }
    }
    
    private init() {
        readDefaultsData()
    }
    
    private func readDefaultsData() {
        let defaults = UserDefaults.standard
        
        if let s = defaults.object(forKey: lastActivityDateKey) {
            lastActivityDate = s as! Date
        }
        else {
            lastActivityDate = Date()
        }
        
        if let s = defaults.object(forKey: categoriesKey) {
            categories = s as! [Category]
        }
        else {
            categories = [Category]()
        }
    }
    
}
