//
//  ToDoApp.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
        WindowGroup {
            
            HomeView(dataController: dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
            
        }
        
    }
    
}
