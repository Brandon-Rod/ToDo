//
//  BaseTestCase.swift
//  ToDoTests
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import XCTest
import CoreData
@testable import ToDo

class BaseTestCase: XCTestCase {

    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!
    
    override func setUpWithError() throws {
        
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
        
    }

}
