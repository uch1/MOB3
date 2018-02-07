//
//  ViewController.swift
//  VeganProductInventory
//
//  Created by Uchenna  Aguocha on 2/6/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class InventoryListController: UITableViewController {

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
        
    }
    
    @objc private func handleAddItem() {
        print("Adding an item into the inventory...")
        let createInventoryController = CreateInventoryController()
        let navController = CustomNavigationController(rootViewController: createInventoryController)
        
        present(navController, animated: true, completion: nil)
    }
    
    
}










