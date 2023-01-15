//
//  TDButtonView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct TDButtonView: View {
    
    let color: String
    let name: String
    
    var body: some View {
        
        Text(name)
            .foregroundColor(Color(Theme.text))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(color), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color(color).opacity(0.8), radius: 5)
        
    }
    
}

struct TDButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TDButtonView(color: "Green", name: "Ok")
    }
}
