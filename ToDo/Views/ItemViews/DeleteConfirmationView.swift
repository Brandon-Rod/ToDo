//
//  DeleteConfirmationView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct DeleteConfirmationView: View {
    
    @Binding var isShowingDelete: Bool
    
    let delete: () -> Void
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("Are you sure you want to delete this item?")
                .font(.title3)
            
            DividerView()
            
            Button { withAnimation(.easeInOut) { isShowingDelete = false } } label: {
                
                TDButtonView(color: "Green", name: "Cancel")
                
            }
            
            Button { withAnimation(.easeInOut) {
                
                delete()
                isShowingDelete = false
                
            } } label: {
                
                TDButtonView(color: "Red", name: "Delete Category")
                
            }
            
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 5)
        
    }
    
}

struct DeleteConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteConfirmationView(isShowingDelete: .constant(true), delete: {})
            .padding(.horizontal)
    }
}
