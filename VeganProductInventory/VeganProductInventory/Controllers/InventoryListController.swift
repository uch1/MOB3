//
//  ViewController.swift
//  VeganProductInventory
//
//  Created by Uchenna  Aguocha on 2/6/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class InventoryListController: UITableViewController, CreateInventoryControllerDelegate {
    
    func didAddInventory(inventory: Inventory) {
        self.inventoryList.append(inventory)
        let newIndexPath = IndexPath(row: inventoryList.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    func didEditInventory(inventory: Inventory) {
        guard let row = inventoryList.index(of: inventory) else { return }
        let reloadIndexPath = IndexPath(row: row, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)
    }
    
    let cellId = "cellId"
    var inventoryList = [Inventory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inventoryList = CoreDataManager.sharedInstance.fetchInventoryList()
        setupTableView()
        setupNavigationItem()
        
    }

    func setupTableView() {
        tableView.register(InventoryCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor.blue
        tableView.tableFooterView = UIView()
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Inventory"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddItem))
    }
    
    // TODO: TODO: Delete all items from Core Data 
    @objc private func handleReset() {
        print("Attempting to delete all items from Core Data")
        
        let context = CoreDataManager.sharedInstance.viewContext
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Inventory.fetchRequest())
        
    }
    
    @objc private func handleAddItem() {
        print("Adding an item into the inventory...")
        let createInventoryController = CreateInventoryController()
        let navController = CustomNavigationController(rootViewController: createInventoryController)
        
        present(navController, animated: true, completion: nil)
    }
    
    
}

// TABLEVIEW Methods
extension InventoryListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! InventoryCell
        let inventory = inventoryList[indexPath.row]
        
        cell.inventory = inventory
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Methods for the header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Methods for the footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Inventory is empty..."
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return inventoryList.count == 0 ? 150: 0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            
            let inventory = self.inventoryList[indexPath.row]
            print("Attempting to delete item from inventory:", inventory.name ?? "")
            
            // remove the inventory item from our tableview
            self.inventoryList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // delete the company from Core Data
            let context = CoreDataManager.sharedInstance.viewContext
            context.delete(inventory)
            
            do {
                try context.save()
            } catch let saveError {
                print("Failed to delete company:", saveError)
            }
            
        }
        
        deleteAction.backgroundColor = UIColor.red
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editActionHandler)
        editAction.backgroundColor = UIColor.blue
        
        return [deleteAction, editAction]
    }
    
    private func editActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        print("Editing inventory in seperate function")
        
        let editInventoryController = CreateInventoryController()
        editInventoryController.inventory = inventoryList[indexPath.row]
        
        let navController = CustomNavigationController(rootViewController: editInventoryController)
        
        present(navController, animated: true, completion: nil)
    }
    
    
}









