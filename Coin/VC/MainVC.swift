//
//  ViewController.swift
//  Coin
//
//  Created by Alex Pasieka on 4/18/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // ivars
    var moneyLeftToSpend : Float = 0.00
    var moneySpent : Float = 0.00
    
    // storyboard references
    @IBOutlet weak var currentMonthLabel : UILabel!
    @IBOutlet weak var moneyLeftToSpendLabel: UILabel!
    @IBOutlet weak var moneySpentLabel: UILabel!
    @IBOutlet weak var categoryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reset budget if month has changed
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        let lastMonthNumber = Int(formatter.string(from: MyAppData.shared.lastActivityDate))
        let currentMonthNumber = Int(formatter.string(from: Date()))
        if lastMonthNumber! < currentMonthNumber! || lastMonthNumber == 12 {
            MyAppData.shared.categories = [Category]()
        }
        
        // display current month
        formatter.dateFormat = "MMMM"
        let currentMonthString = formatter.string(from: MyAppData.shared.lastActivityDate)
        currentMonthLabel.text = currentMonthString
        
        // calculate money left to spend
        moneyLeftToSpend = 0.00
        for c in MyAppData.shared.categories {
            moneyLeftToSpend += c.moneyLeftToSpend
        }
        
        // calculate money spent
        moneySpent = 0.00
        for c in MyAppData.shared.categories {
            moneySpent += c.moneySpent
        }
        
        // display calculated budget information
        moneyLeftToSpendLabel.text = String(format: "$%.2f", moneyLeftToSpend)
        moneySpentLabel.text = String(format: "$%.2f", moneySpent)
        
        // load category list data
        categoryList.dataSource = self
        categoryList.delegate = self
        categoryList.reloadData()
        
        // save current date to user defaults as last activity date
        MyAppData.shared.lastActivityDate = Date()
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAppData.shared.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        let percentage = ((category.moneySpent / category.maxAmount) * 100).isNaN ? 0 : (category.moneySpent / category.maxAmount) * 100
        cell.detailTextLabel?.text = String(format: "%2.f%% Spent", percentage)
        return cell
    }
    
    // MARK: - Unwind Segues
    
    @IBAction func unwindWithDoneTapped(segue: UIStoryboardSegue) {
        if let inputSpendingVC = segue.source as? InputSpendingVC {
            if let amount = inputSpendingVC.amount, let category = inputSpendingVC.category {
                if let c = MyAppData.shared.categories.first(where: { $0.name == category }) {
                    c.moneyLeftToSpend -= amount
                    c.moneySpent += amount
                    
                    viewDidLoad()
                }
            }
        }
    }

}
