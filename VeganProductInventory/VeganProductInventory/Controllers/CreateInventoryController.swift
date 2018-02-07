//
//  CreateInventoryController.swift
//  VeganProductInventory
//
//  Created by Uchenna  Aguocha on 2/6/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

// Custom Delegation
protocol CreateInventoryControllerDelegate {
    func didAddInventory(inventory: Inventory)
    func didEditInventory(inventory: Inventory)
}

class CreateInventoryController: UIViewController {
    
    var inventory: Inventory? {
        didSet {
            nameTextField.text = inventory?.name
            quantityTextField.text = String(describing: inventory?.quantity)
            
            guard let productDate = inventory?.date else { return }
            datePicker.date = productDate
        }
    }
    
    var delegate: CreateInventoryControllerDelegate?
    
    // MARK: Created UIElements
    let lightBlueBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        return backgroundView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        return textField
    }()
    
    let quantityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter quantity"
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Create Inventory"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
    }
    
    @objc func handleCancel() {
        print("Cancel...")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSave() {
        print("Saving items....")
        createInventory()
    }
    
    func createInventory() {
        print("Save inventory..")
        
        let context = CoreDataManager.sharedInstance.viewContext
        
        let inventory = NSEntityDescription.insertNewObject(forEntityName: "Inventory", into: context)
        
        inventory.setValue(nameTextField.text, forKey: "name")
        inventory.setValue(quantityTextField.text, forKey: "quantity")
        
        do {
            try context.save()
            
            dismiss(animated: true, completion: {
                self.delegate?.didAddInventory(inventory: inventory as! Inventory)
            })
            
        } catch let saveError {
            print("Failed to save inventory:", saveError)
        }
    }
    
    
}























