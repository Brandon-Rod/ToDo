//
//  HomeViewModel.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import CoreData

final class HomeViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    
    private let itemsController: NSFetchedResultsController<Item>
    
    let dataController: DataController
    
    @Published var items = [Item]()
    @Published var isShowingNewItemView = false
    
    init(dataController: DataController) {
        
        self.dataController = dataController
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.creationDate, ascending: false)]
        
        itemsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: dataController.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        itemsController.delegate = self
        
        do {
            
            try itemsController.performFetch()
            items = itemsController.fetchedObjects ?? []
            
        } catch {
            
            fatalError("Error accessing Core Data.")
                        
        }
        
    }
    
    /// Automatically updates the array of Item.
    /// - Parameter controller: Item Core Data Object
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        if let newItems = controller.fetchedObjects as? [Item] {
            
            items = newItems
            
        }
        
    }
    
}
