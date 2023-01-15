//
//  ItemView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct ItemView: View {
    
    @ObservedObject var item: Item
    
    private var label: Text {
        
        if item.completed {
            
            return Text("Item completed." + item.itemName)
            
        } else {
            
            return Text("Item incomplete." + item.itemName)
            
        }
        
    }
    
    var body: some View {
        
        HStack(spacing: 5) {
            
            Button {
                
                withAnimation(.easeInOut) { item.completed.toggle() }
                
            } label: {
                
                Image(systemName: item.completed ? Symbols.filledCircle : Symbols.circle)
                    .foregroundColor(Color(Theme.text))
                    .shadow(radius: 5)
                
            }

            
            Text(item.itemName)
                .foregroundColor(Color(Theme.text))
            
            Spacer()
            
        }
        .padding(10)
        .accessibilityLabel(label)
        .frame(maxWidth: .infinity)
        .background(Color(item.itemColor), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color(item.itemColor).opacity(0.8), radius: 5)
        
    }
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item.example)
            .padding(.horizontal)
    }
}
