//
//  ChangeBudgetVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class ChangeBudgetVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAppData.shared.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        cell.detailTextLabel?.text = String(format: "$%.2f", category.maxAmount)
        return cell
    }
    
    @IBAction func unwindWithDoneTapped(segue: UIStoryboardSegue) {
        if let newCategoryVC = segue.source as? NewCategoryVC {
            if let maxAmount = newCategoryVC.maxAmount, let name = newCategoryVC.name {
                var categories = MyAppData.shared.categories
                categories.append(Category(name: name, maxAmount: maxAmount, moneyLeftToSpend: maxAmount, moneySpent: 0.00))
                MyAppData.shared.categories = categories
            }
        }
    }

}
