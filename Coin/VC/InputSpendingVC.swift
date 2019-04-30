//
//  InputSpendingVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

// custom input spending view controller class
class InputSpendingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // storyboard references
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var categoryField: UITableView!
    
    // ivars
    var amount: Float?
    var category: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load category list data
        categoryField.dataSource = self
        categoryField.delegate = self
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAppData.shared.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // intialize cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        // for each current budget category
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // reset checkmark
        for cell in tableView.visibleCells {
            cell.accessoryType = .none
        }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            // return the selected category cell
            let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
            cell.accessoryType = .checkmark
            category = cell.textLabel!.text
        }
    }
    
    // MARK: - Navigation
    
    // done input spending amount (and category) segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        amount = (amountField.text?.count)! > 0 ? Float(amountField.text!) : nil
    }
    
}
