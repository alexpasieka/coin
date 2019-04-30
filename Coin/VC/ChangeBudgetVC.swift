//
//  ChangeBudgetVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

// custom change budget table view controller class
class ChangeBudgetVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // reload data after new category is created
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
        // initialize cell (using detailed cell style)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        // for each current budget category
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        cell.detailTextLabel?.text = String(format: "$%.2f", category.maxAmount)
        
        return cell
    }
    
    // MARK: - Navigation
    
    // done changing current budget unwind segue
    @IBAction func unwindWithDoneTapped(segue: UIStoryboardSegue) {
        // initialize segue source
        if let newCategoryVC = segue.source as? NewCategoryVC {
            // if both fields were filled out
            if let maxAmount = newCategoryVC.maxAmount, let name = newCategoryVC.name {
                // create the new category
                var categories = MyAppData.shared.categories
                categories.append(Category(name: name, maxAmount: maxAmount, moneyLeftToSpend: maxAmount, moneySpent: 0.00))
                MyAppData.shared.categories = categories
            }
        }
    }

}
