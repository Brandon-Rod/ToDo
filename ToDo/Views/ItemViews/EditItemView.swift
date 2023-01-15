//
//  EditItemView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct EditItemView: View {
    
    @EnvironmentObject var dataController: DataController
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var item: Item
    
    @State private var name: String
    @State private var completed: Bool
    @State private var color: String
    
    @State private var isShowingDelete = false
    
    init(item: Item) {
        
        self.item = item
        
        _name = State(wrappedValue: item.itemName)
        _completed = State(wrappedValue: item.completed)
        _color = State(wrappedValue: item.itemColor)
        
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 10) {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Name")
                        .foregroundColor(Color(Theme.text))
                        .font(.title2)
                    
                    TextField("Enter Name", text: $name.onChange(update))
                        .modifier(TDTextFieldModifier())
                    
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Completion")
                        .foregroundColor(Color(Theme.text))
                        .font(.title2)
                    
                    Toggle("Completed", isOn: $completed.onChange(update))
                        .toggleStyle(SwitchToggleStyle(tint: Color(color)))
                        .padding(10)
                        .background(Color(Theme.detailBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(radius: 5)
                    
                }
                
                ColorSelectionView(color: $color.onChange(update))
                
                Button { withAnimation(.easeInOut) { isShowingDelete = true } } label: {
                    
                    TDButtonView(color: "Red", name: "Delete Item")
                    
                }

                Spacer()
                
            }
            .padding()
            
        }
        .navigationTitle("Edit Item")
        .onDisappear { dataController.save() }
        .animation(.easeInOut, value: color)
        .blur(radius: isShowingDelete ? 5 : 0)
        .disabled(isShowingDelete)
        .overlay {
            
            if isShowingDelete {
                
                DeleteConfirmationView(isShowingDelete: $isShowingDelete, delete: delete)
                    .padding(.horizontal)
                
            }
            
        }
        
    }
    
    func update() {
        
        item.name = name
        item.completed = completed
        item.color = color
        
    }
    
    func delete() {
        
        dataController.delete(item)
        dataController.save()
        presentationMode.wrappedValue.dismiss()
        
    }
    
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        
            EditItemView(item: Item.example)
            
        }
    }
}
