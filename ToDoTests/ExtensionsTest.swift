//
//  ExtensionsTest.swift
//  ToDoTests
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import SwiftUI
import XCTest
@testable import ToDo

final class ExtensionsTest: XCTestCase {

    func testBindingOnChange() {
        
        var onChangeFunctionRun = false
        
        func exampleFunctionToCall() {
            
            onChangeFunctionRun = true
            
        }
        
        var storedValue = ""
        
        let binding = Binding(
        
            get: { storedValue },
            set: { storedValue = $0 }
            
        )
        
        let changedBinding = binding.onChange(exampleFunctionToCall)
        changedBinding.wrappedValue = "Test"
        
        XCTAssertTrue(onChangeFunctionRun, "The onChange() function must be run when the binding is changed.")
        
    }

}
