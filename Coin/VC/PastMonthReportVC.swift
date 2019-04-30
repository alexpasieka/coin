//
//  PastMonthReportVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/29/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class PastMonthReportVC: UIViewController {
    
//    let simpleCell = "simpleCell"
//    enum MySection: Int {
//        case title = 0, description, viewOnWeb
//    }
    
    
    var month: Month?
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var budgetResultLabel: UILabel!
    @IBOutlet weak var categoryList: UITableView!
    
    var moneySpent : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for c in month!.report {
            moneySpent += c.moneySpent
        }
        
        print(moneySpent)
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCell, for: indexPath)
//
//        // Configure the cell...
//        if indexPath.section == MySection.title.rawValue{
//            cell.textLabel?.text = bookmark?.name
//            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
//        }
//
//        // Configure the cell...
//        if indexPath.section == MySection.description.rawValue{
//            cell.textLabel?.numberOfLines = 0
//            cell.textLabel?.text = "We could add a description of the link here, tags, etc ..."
//            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
//        }
//
//        if indexPath.section == MySection.viewOnWeb.rawValue{
//            cell.textLabel?.text = "View on web"
//            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
//            cell.textLabel?.textColor = view.tintColor // clickable blue
//            cell.textLabel?.textAlignment = NSTextAlignment.center
//        }
//
//
//        return cell
//    }
    
}
