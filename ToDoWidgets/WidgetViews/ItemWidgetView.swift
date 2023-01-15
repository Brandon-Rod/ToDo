//
//  ItemWidgetView.swift
//  ToDoWidgetsExtension
//
//  Created by Brandon Rodriguez on 1/12/23.
//

import SwiftUI

struct ItemWidgetView: View {
    
    @ObservedObject var item: Item
    
    var body: some View {
        
        HStack(spacing: 5) {
            
            Image(systemName: item.completed ? Symbols.filledCircle : Symbols.circle)
                .foregroundColor(Color(Theme.text))
                .shadow(radius: 5)
            
            Text(item.itemName)
                
            Spacer()
            
        }
        .frame(maxHeight: .infinity)
        .padding()
        
    }
    
}
