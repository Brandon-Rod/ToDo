//
//  NewItemView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct NewItemView: View {
    
    @EnvironmentObject var dataController: DataController
    
    @Binding var isShowingNewItemView: Bool
    
    @State private var name = ""
    @State private var invalidName = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            TextField("Enter Name", text: $name)
                .modifier(TDTextFieldModifier())
            
            if invalidName {
                
                Text("Please enter a name")
                    .font(.caption)
                    .foregroundColor(Color("Red"))
                
                DividerView()
                
            }
            
            Button { withAnimation(.easeInOut) { isShowingNewItemView = false } } label: {
                
                TDButtonView(color: "Red", name: "Cancel")
                
            }
            
            Button { createItem() } label: {
                
                TDButtonView(color: "Green", name: "Create Item")
                
            }

            
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous)).shadow(radius: 5)
        
    }
    
    func createItem() {
        
        if name.isEmpty {
            
            withAnimation(.easeInOut) { invalidName = true }
            
        } else {
            
            withAnimation(.easeInOut) {
                
                let newItem = Item(context: dataController.container.viewContext)
                newItem.name = name
                newItem.color = "Green"
                newItem.completed = false
                newItem.creationDate = Date()
                
                dataController.save()
                isShowingNewItemView = false
                
            }
            
        }
        
    }
    
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(isShowingNewItemView: .constant(true))
            .padding(.horizontal)
    }
}
