//
//  NewCategoryVC.swift
//  Coin
//
//  Created by Alex Pasieka on 4/22/19.
//  Copyright © 2019 Alex Pasieka. All rights reserved.
//

import UIKit

class NewCategoryVC: UIViewController {

    var name : String?
    var maxAmount : Float?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = (nameField.text?.count)! > 0 ? nameField.text! : nil
        maxAmount = (amountField.text?.count)! > 0 ? Float(amountField.text!) : nil
    }

}
