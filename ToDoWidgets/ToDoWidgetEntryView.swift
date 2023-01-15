//
//  ToDoWidgetEntryView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import SwiftUI
import WidgetKit

struct ToDoWidgetEntryView: View {
    
    @Environment(\.widgetFamily) private var widgetFamily
    
    var entry: Provider.Entry
    
    private var itemSlice: Int {
        
        var itemCount: Int
        
        switch widgetFamily {
        
        case .systemSmall:
            itemCount = 1
            
        case .systemLarge:
            itemCount = 5
            
        default: itemCount = 3
        
        }
        
        return itemCount
        
    }
    
    var body: some View  {
        
        switch widgetFamily {
            
        case .systemSmall:
            if let item = entry.items.first {
                
                ItemWidgetView(item: item)
                    .background(Color(item.itemColor))
                
            } else {
                
                EmptyItemsView()
                    .background(Color("Green").gradient)
                
            }
            
        case .systemLarge:
            WidgetView(entry: entry, itemSlice: itemSlice)
                .background(Color(Theme.detailBackground))
                        
        default:
            WidgetView(entry: entry, itemSlice: itemSlice)
                .background(Color(Theme.detailBackground))
            
        }
        
    }
    
}
