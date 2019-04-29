//
//  InputSpendingVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class InputSpendingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var amount : Float?
    var category : String?
    
    @IBOutlet weak var amountField : UITextField!
    @IBOutlet weak var categoryField: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = MyAppData.shared.categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        //getting the text of that cell
        category = currentCell.textLabel!.text
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        amount = (amountField.text?.count)! > 0 ? Float(amountField.text!) : nil
    }
    
}
