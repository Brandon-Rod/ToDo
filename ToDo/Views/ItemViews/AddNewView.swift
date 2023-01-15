//
//  AddNewItemView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct AddNewView: View {
    
    var body: some View {
        
        Image(systemName: Symbols.plus)
            .resizable()
            .scaledToFit()
            .foregroundColor(Color(Theme.text))
            .frame(width: 25, height: 25)
            .padding()
            .background(.green.gradient, in: Circle())
            .shadow(color: .black.opacity(0.8), radius: 5)
        
    }
    
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}
