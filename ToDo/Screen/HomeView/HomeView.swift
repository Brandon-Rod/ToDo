//
//  ContentView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel
    
    @EnvironmentObject var dataController: DataController
    
    init(dataController: DataController) {
        
        let viewModel =  HomeViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
        
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 10) {
                    
                    if viewModel.items.isEmpty {
                        
                        EmptyItemsView()
                        
                    } else {
                        
                        itemsView
                        
                    }
                    
                }
                .padding()
                
            }
            .navigationTitle("ToDo")
            .frame(maxWidth: .infinity)
            .onDisappear { dataController.save() }
            .blur(radius: viewModel.isShowingNewItemView ? 5 : 0)
            .disabled(viewModel.isShowingNewItemView)
            .overlay {
                
                if viewModel.isShowingNewItemView {
                    
                    NewItemView(isShowingNewItemView: $viewModel.isShowingNewItemView)
                        .padding(.horizontal)
                    
                }
                
            }
            .overlay(alignment: .bottomTrailing) { addNewView }
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
    
    static var previews: some View {
        HomeView(dataController: dataController)
    }
    
}

private extension HomeView {
    
    var itemsView: some View {
        
        ForEach(viewModel.items) { item in
            
            NavigationLink(destination: EditItemView(item: item)) {
                
                ItemView(item: item)
                
            }
            
        }
        
    }
    
    var addNewView: some View {
        
        Button {
            
            withAnimation(.easeInOut) {
                
                viewModel.isShowingNewItemView.toggle()
                
            }
            
        } label: {
            
            AddNewView()
                .padding()
            
        }
        
    }
    
}
