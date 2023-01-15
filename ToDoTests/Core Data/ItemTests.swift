//
//  ItemTests.swift
//  ToDoTests
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import XCTest
import CoreData
@testable import ToDo

final class ItemTests: BaseTestCase {

    func testCreatingItems() {
        
        let targetCount = 10
        
        for _ in 0..<targetCount {
            
            let _ = Item(context: managedObjectContext)
            
        }
        
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), targetCount, "Target count should be 10")
        
    }
    
    func testDeletingItem() throws {
        
        try dataController.createSampleData()
        
        let request = NSFetchRequest<Item>(entityName: "Item")
        let items = try managedObjectContext.fetch(request)
        
        dataController.delete(items[0])
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 4, "The count should be 4")
        
    }

}
