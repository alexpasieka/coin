//
//  PastMonthsVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class PastMonthsVC: UITableViewController {
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAppData.shared.pastMonths.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "categoryCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let month = MyAppData.shared.pastMonths[indexPath.row]
        cell.textLabel?.text = month.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            guard selectedRow < MyAppData.shared.pastMonths.count else{
                print("none")
                return
            }
            let reportVC = segue.destination as! PastMonthReportVC
            reportVC.month = MyAppData.shared.pastMonths[selectedRow]
        }
    }

}
