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
            categories = categories.sorted(by: { $0.name < $1.name })
            let defaults = UserDefaults.standard
            try! defaults.set(JSONEncoder().encode(categories), forKey: categoriesKey)
        }
    }
    
    let pastMonthsKey : String = "pastMonthsKey"
    var pastMonths : [Month] = [Month]() {
        didSet {
            let defaults = UserDefaults.standard
            try! defaults.set(JSONEncoder().encode(pastMonths), forKey: pastMonthsKey)
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
            guard let encodedData = defaults.object(forKey: categoriesKey) as? Data else {
                return
            }
            categories = try! JSONDecoder().decode([Category].self, from: encodedData)
        }
        else {
            categories = [Category]()
        }
        
        if let s = defaults.object(forKey: pastMonthsKey) {
            guard let encodedData = defaults.object(forKey: pastMonthsKey) as? Data else {
                return
            }
            pastMonths = try! JSONDecoder().decode([Month].self, from: encodedData)
        }
        else {
            pastMonths = [Month]()
        }
    }
    
}
