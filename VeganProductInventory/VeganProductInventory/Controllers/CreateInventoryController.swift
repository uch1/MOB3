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
    
    
    // Property Observer
    var inventory: Inventory? {
        didSet {
            nameTextField.text = inventory?.name
            quantityTextField.text = String(describing: inventory?.quantity)
            
            guard let productDate = inventory?.date else { return }
            datePicker.date = productDate
        }
    }
    
    // Delegation
    var delegate: CreateInventoryControllerDelegate?
    
    // MARK: Created UIElements
    let lightBlueBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.green
        return backgroundView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.backgroundColor = .red
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
        view.backgroundColor = UIColor.white
        setupNavigationItem()
        setupLayout()
    }
    

    
    func setupLayout() {
        
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 350))
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: lightBlueBackgroundView.topAnchor, leading: lightBlueBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 100, height: 50))
        
        //view.addSubview(nameTextField)
        
        //view.addSubview(quantityLabel)
        
        //view.addSubview(quantityTextField)
        
        //view.addSubview(datePicker)
        
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
        
        if inventory == nil {
            createInventory()
        } else {
            saveInventoryChanges()
        }
    }
    
    private func saveInventoryChanges() {
        let context = CoreDataManager.sharedInstance.viewContext
        
        inventory?.name = nameTextField.text
        
        guard let unwrappedQuantity = quantityTextField.text else { return }
        inventory?.quantity = Int64(unwrappedQuantity)!
        
        inventory?.date = datePicker.date

        
        do {
            try context.save()
            // save succeeded
            dismiss(animated: true, completion: {
                guard let unwrappedInventory = self.inventory else { return }
                self.delegate?.didEditInventory(inventory: unwrappedInventory)
            })
            
        } catch let saveError {
            print("Failed to save changes:", saveError)
        }
        
    }
    
    func createInventory() {
        print("Save inventory..")
        
        let context = CoreDataManager.sharedInstance.viewContext
        
        let inventory = NSEntityDescription.insertNewObject(forEntityName: "Inventory", into: context) as! Inventory
        inventory.name = nameTextField.text
        
        guard let unwrappedQuantityTextFieldText = quantityTextField.text else { return }
        
        inventory.quantity = Int64(unwrappedQuantityTextFieldText)!
        inventory.date = datePicker.date
        
//        inventory.setValue(nameTextField.text, forKey: "name")
//        inventory.setValue(quantityTextField.text, forKey: "quantity")
        
        do {
            try context.save()
            
            dismiss(animated: true, completion: {
                self.delegate?.didAddInventory(inventory: inventory)
            })
            
        } catch let saveError {
            print("Failed to save inventory:", saveError)
        }
    }
    
    
}























