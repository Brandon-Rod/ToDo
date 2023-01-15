//
//  ColorManagerTest.swift
//  ToDoTests
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import XCTest
@testable import ToDo

final class ColorManagerTest: XCTestCase {

    func testColorsExist() {
        
        for color in ColorManager.allCases {
            
            XCTAssertNotNil(UIColor(named: color.rawValue), "Failed to load color '\(color)' from asset catalog")
            
        }
        
    }

}
