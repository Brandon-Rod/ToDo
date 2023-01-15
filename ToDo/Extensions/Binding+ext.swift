//
//  Binding+ext.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

extension Binding {
    
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        
        Binding(
        
            get: { self.wrappedValue },
            set: { newValue in
                
                self.wrappedValue = newValue
                handler()
                
            }
        
        )
        
    }
    
}
