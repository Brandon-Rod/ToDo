//
//  WidgetView.swift
//  ToDoWidgetsExtension
//
//  Created by Brandon Rodriguez on 1/12/23.
//

import SwiftUI

struct WidgetView: View {
    
    var entry: Provider.Entry
    var itemSlice: Int
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            if entry.items.isEmpty {
                
                EmptyItemsView()
                
            } else {
                
                ForEach(entry.items.prefix(itemSlice)) { item in
                    
                    HStack(spacing: 5) {
                        
                        Image(systemName: item.completed ? Symbols.filledCircle : Symbols.circle)
                            .foregroundColor(Color(Theme.text))
                            .shadow(radius: 5)
                        
                        Text(item.itemName)
                            
                        Spacer()
                        
                    }
                    .padding(5)
                    .background(Color(item.itemColor))
                    .cornerRadius(5)
                    .shadow(color: Color(item.itemColor).opacity(0.8), radius: 2)
                    
                }
                
            }
            
            Spacer()
            
        }
        .frame(maxHeight: .infinity)
        .padding()
        
    }
    
}
