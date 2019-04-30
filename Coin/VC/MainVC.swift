//
//  ViewController.swift
//  Coin
//
//  Created by Alex Pasieka on 4/18/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

// custom main view controller class
class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // storyboard references
    @IBOutlet weak var currentMonthLabel: UILabel!
    @IBOutlet weak var moneyLeftToSpendLabel: UILabel!
    @IBOutlet weak var moneySpentLabel: UILabel!
    @IBOutlet weak var categoryList: UITableView!
    
    // ivars
    var moneyLeftToSpend: Float = 0.00
    var moneySpent: Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reset budget if month has changed
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        let lastMonthNumber = Int(formatter.string(from: MyAppData.shared.lastActivityDate))
        let currentMonthNumber = Int(formatter.string(from: Date()))
        if lastMonthNumber! != currentMonthNumber! {
            // add last month budget data to past months data
            var allMonths = MyAppData.shared.pastMonths
            formatter.dateFormat = "MMMM yyyy"
            allMonths.append(Month(name: formatter.string(from: MyAppData.shared.lastActivityDate), report: MyAppData.shared.categories))
            MyAppData.shared.pastMonths = allMonths
            
            // reset budget
            MyAppData.shared.categories = [Category]()
        }
        
        // display current month
        formatter.dateFormat = "MMMM"
        currentMonthLabel.text = formatter.string(from: Date())
        
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
        
        // if the user has over spent
        if moneyLeftToSpend < 0.00 {
            moneyLeftToSpendLabel.text = String(format: "-$%.2f", abs(moneyLeftToSpend))
            moneyLeftToSpendLabel.textColor = UIColor.red
        }
        
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
        // initialize cell (using detailed cell style)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        // for each current budget category
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        cell.detailTextLabel?.text = String(format: "$%.2f / $%.2f Spent", category.moneySpent, category.maxAmount)
        
        return cell
    }
    
    // MARK: - Navigation
    
    // done input spending segue
    @IBAction func unwindWithDoneTapped(segue: UIStoryboardSegue) {
        // initialize segue source
        if let inputSpendingVC = segue.source as? InputSpendingVC {
            // if both fields were filled out
            if let amount = inputSpendingVC.amount, let category = inputSpendingVC.category {
                // find category
                if let c = MyAppData.shared.categories.first(where: { $0.name == category }) {
                    // remove category
                    MyAppData.shared.categories = MyAppData.shared.categories.filter { $0.name != c.name }
                    
                    // update category
                    c.moneyLeftToSpend -= amount
                    c.moneySpent += amount
                    
                    // re-append category
                    MyAppData.shared.categories.append(c)
                    
                    // reload main view
                    viewDidLoad()
                }
            }
        }
    }

}
