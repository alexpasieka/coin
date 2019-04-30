//
//  MyAppData.swift
//  Coin
//
//  Created by Alex Pasieka on 4/23/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import Foundation

// custom singleton saved app data class
class MyAppData {
    
    // single instance of class
    static let shared = MyAppData()
    
    // last user activity date
    let lastActivityDateKey: String = "lastActivityDateKey"
    var lastActivityDate: Date = Date() {
        didSet {
            // save to disk
            let defaults = UserDefaults.standard
            defaults.set(lastActivityDate, forKey: lastActivityDateKey)
        }
    }
    
    // current budget categories
    let categoriesKey: String = "categoriesKey"
    var categories: [Category] = [Category]() {
        didSet {
            // sort categories alphabetically
            categories = categories.sorted(by: { $0.name < $1.name })
            // save to disk (by encoding to JSON)
            let defaults = UserDefaults.standard
            try! defaults.set(JSONEncoder().encode(categories), forKey: categoriesKey)
        }
    }
    
    // past budgets (months)
    let pastMonthsKey: String = "pastMonthsKey"
    var pastMonths: [Month] = [Month]() {
        didSet {
            // save to disk (by encoding to JSON)
            let defaults = UserDefaults.standard
            try! defaults.set(JSONEncoder().encode(pastMonths), forKey: pastMonthsKey)
        }
    }
    
    // designated private initializer
    private init() {
        readDefaultsData()
    }
    
    // read saved data from disk
    private func readDefaultsData() {
        let defaults = UserDefaults.standard
        
        // read last activity date
        if let s = defaults.object(forKey: lastActivityDateKey) {
            lastActivityDate = s as! Date
        }
        else {
            lastActivityDate = Date()
        }
        
        // read current budget categories
        if let s = defaults.object(forKey: categoriesKey) {
            guard let encodedData = defaults.object(forKey: categoriesKey) as? Data else { return }
            categories = try! JSONDecoder().decode([Category].self, from: encodedData)
        }
        else {
            categories = [Category]()
        }
        
        // read past budgets (months)
        if let s = defaults.object(forKey: pastMonthsKey) {
            guard let encodedData = defaults.object(forKey: pastMonthsKey) as? Data else { return }
            pastMonths = try! JSONDecoder().decode([Month].self, from: encodedData)
        }
        else {
            pastMonths = [Month]()
        }
    }
    
}
