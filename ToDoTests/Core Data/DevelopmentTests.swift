//
//  DevelopmentTests.swift
//  ToDoTests
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import XCTest
import CoreData
@testable import ToDo

final class DevelopmentTests: BaseTestCase {

    func testSampleDataWorks() throws {
        
        try dataController.createSampleData()
        
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 5, "There should be 5 sample Items.")

    }

}
