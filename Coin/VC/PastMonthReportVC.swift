//
//  PastMonthReportVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class PastMonthReportVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var month: Month!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var budgetResultLabel: UILabel!
    @IBOutlet weak var categoryList: UITableView!
    
    var moneySpent : Float = 0.00
    var moneyLeftToSpend : Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthLabel.text = month.name
        
        for c in month.report {
            moneyLeftToSpend += c.moneyLeftToSpend
        }
        
        budgetResultLabel.text = String(moneyLeftToSpend)
        
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
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        cell.detailTextLabel?.text = String(format: "$%.2f / $%.2f Spent", category.moneySpent, category.maxAmount)
        return cell
    }
    
}
