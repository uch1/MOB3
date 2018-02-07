//
//  CoreDataManager.swift
//  VeganProductInventory
//
//  Created by Uchenna  Aguocha on 2/6/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import CoreData

public final class CoreDataManager {
    
    // Create a singleton for global access to the class
    static let sharedInstance = CoreDataManager()
    
    // Define the Persistent Container. Note: Persistent Container creates and handles the context, model, store coordinator
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let veganInventoryModel = "VeganInventoryModel"
        let container = NSPersistentContainer(name: veganInventoryModel)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        })
        
        return container
    }()
    
    // Create a context for the main queue
    lazy var viewContext: NSManagedObjectContext = {
        let viewContext = persistentContainer.viewContext
        return viewContext
    }()
    
    // Create a context to run on the background queue
    // When updating or changing data happens
    lazy var privateContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return context
    }()
    
    
    // Create a function that fetches inventory from Inventroy Model
    func fetchInventoryList() -> [Inventory] {

//        let context = persistentContainer.viewContext
        
        let context = viewContext
        
        let fetchRequest = NSFetchRequest<Inventory>(entityName: "Inventory")
        
        do {
            let inventories = try context.fetch(fetchRequest)
            return inventories
            
        } catch let fetchError {
            print("Failed to fetch error:", fetchError)
            return []
        }

    }
    
    
    
}










