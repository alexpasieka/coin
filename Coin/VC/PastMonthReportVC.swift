//
//  PastMonthReportVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

// custom past month budget report view controller class
class PastMonthReportVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // storyboard references
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var budgetResultLabel: UILabel!
    @IBOutlet weak var budgetResultLabel2: UILabel!
    @IBOutlet weak var categoryList: UITableView!
    
    // ivars
    var month: Month!
    var moneyLeftToSpend: Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set month name and year as title
        navigationBar.title = month.name
        
        // add up all money not spent from every category for this month
        for c in month.report {
            moneyLeftToSpend += c.moneyLeftToSpend
        }
        
        // display budget result
        budgetResultLabel.text = String(format: "$%.2f", abs(moneyLeftToSpend))
        budgetResultLabel.textColor = moneyLeftToSpend < 0.00 ? UIColor.red : UIColor.green
        budgetResultLabel2.text = moneyLeftToSpend < 0.00 ? "Over Budget" : "Under Budget"
        
        // load category list data
        categoryList.dataSource = self
        categoryList.delegate = self
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.report.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // initialize cell (using detailed cell style)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        // for each category in the month
        let category = month.report[indexPath.row]
        cell.textLabel?.text = category.name
        cell.detailTextLabel?.text = String(format: "$%.2f / $%.2f Spent", category.moneySpent, category.maxAmount)
        
        return cell
    }
    
}
