//
//  TDTextFieldModifier.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct TDTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(Color(Theme.text))
            .font(.title3)
            .padding(10)
            .background(Color(Theme.detailBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
    
}
