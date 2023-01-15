//
//  ToDoWidget.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/11/23.
//

import WidgetKit
import SwiftUI

@main
struct ToDoWidget: Widget {
    
    let kind: String = "ToDoWidget"
    
    var body: some WidgetConfiguration {
        
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            
            ToDoWidgetEntryView(entry: entry)
            
        }
        .configurationDisplayName("Items")
        .description("Get a snippet of your items.")
        
    }
    
}

struct ToDoWidget_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ToDoWidgetEntryView(entry: SimpleEntry(date: Date(), items: [Item.example]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
    }
    
}
