//
//  AddInventoryViewController.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class AddInventoryViewController: UIViewController {
    let coreDataStack = CoreDataStack.instance
    
    @IBOutlet weak var inventoryNameField: UITextField!
    @IBOutlet weak var inventoryQuantityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        guard let inventoryName = inventoryNameField.text, let inventoryQuantity = Int64(inventoryQuantityField.text!) else {return}
        
        let privateContext = coreDataStack.privateContext
        let inventory = Inventory(context: privateContext)
//        let inv = Inventory(
//            context: coreDataStack.privateContext
//        )
        
        inventory.name = inventoryName
        inventory.quantity = inventoryQuantity
        
//        coreDataStack.saveTo(context: coreDataStack.privateContext)
        coreDataStack.saveTo(context: privateContext)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
