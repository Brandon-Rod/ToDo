//
//  Item-CoreDataHelpers.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import Foundation


extension Item {
    
    var itemName: String {
        
        name ?? ""
        
    }
    
    var itemColor: String {
        
        color ?? "Green"
        
    }
    
    var itemCreationDate: String {
        
        let date = creationDate ?? Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)

    }
    
    static var example: Item {
        
        let controller = DataController.preview
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.name = "Example Name"
        item.color = "Green"
        item.completed = false
        item.creationDate = Date()
        return item
        
    }
    
}
