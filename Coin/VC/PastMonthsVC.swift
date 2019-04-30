//
//  PastMonthsVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

// custom past month list table view controller class
class PastMonthsVC: UITableViewController {
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAppData.shared.pastMonths.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // initialize cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        // for each past month
        let month = MyAppData.shared.pastMonths[indexPath.row]
        cell.textLabel?.text = month.name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // MARK: - Navigation
    
    // past month budget report segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            // setup for report segue
            let reportVC = segue.destination as! PastMonthReportVC
            reportVC.month = MyAppData.shared.pastMonths[indexPath.row]
        }
    }

}
