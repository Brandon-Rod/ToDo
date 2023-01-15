//
//  DataController.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import CoreData
import WidgetKit

/// The environment singleton responsible for managing the Core Data stack, fetch requests, and updating widgets.
final class DataController: ObservableObject {
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
            
        container = NSPersistentContainer(name: "Main")

        if inMemory {
            
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
            
        } else {
            
            let groupID = "group.com.brandonrodriguez.ToDo"

            if let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID) {

                container.persistentStoreDescriptions.first?.url = url.appendingPathComponent("Main.sqlite")

            }
            
        }
        
        container.loadPersistentStores { storeDescription, error in
            
            if let error = error {
                
                fatalError("Fatal error loading store: \(error.localizedDescription).")
                
            }
            
        }
        
    }
    
    /// Adds data for testing in previews
    static var preview: DataController = {
        
        let dataController = DataController(inMemory: true)
        
        do {
            
            try dataController.createSampleData()
            
        } catch {
            
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
            
        }
        
        return dataController
        
    }()
    
    func createSampleData() throws {
        
        let viewContext = container.viewContext
        
        for i in 1...5 {
            
            let item = Item(context: viewContext)
            item.name = "Test \(i)"
            item.color = ColorManager.allCases.randomElement()?.rawValue
            item.completed = Bool.random()
            item.creationDate = Date()
            
        }
        
        try viewContext.save()
        
    }
    
    func save() {
        
        if container.viewContext.hasChanges {
            
            try? container.viewContext.save()
            WidgetCenter.shared.reloadAllTimelines()
            
        }
        
    }
    
    func delete(_ object: NSManagedObject) {
        
        container.viewContext.delete(object)
        
    }
    
    /// Returns the number of objects for specified Core Data Object
    /// - Parameter fetchRequest: Core Data Object
    /// - Returns: Number of objects
    func count(for fetchRequest: NSFetchRequest<Item>) -> Int {
        
        (try? container.viewContext.count(for: fetchRequest)) ?? 0
        
    }
    
    /// Fetches List's from Core Data
    /// - Parameter count: Number of List's that'll be returned
    /// - Returns: The fetched Item
    func fetchRequestForItems(count: Int) -> NSFetchRequest<Item> {
        
        let itemRequest: NSFetchRequest<Item> = Item.fetchRequest()
        itemRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Item.creationDate, ascending: false)]
        itemRequest.fetchLimit = count
        
        return itemRequest
        
    }
    
    /// Returns the results of the fetch request from Item
    /// - Parameter fetchRequest: The object that'll be fetched
    /// - Returns: The fetch request for Item
    func results(for fetchRequest: NSFetchRequest<Item>) -> [Item] {
        
        return (try? container.viewContext.fetch(fetchRequest)) ?? []
        
    }
    
}
