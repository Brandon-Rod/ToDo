//
//  DividerView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct DividerView: View {
    
    var body: some View {
        
        Color(Theme.text)
            .frame(height: 1)
            .cornerRadius(5)
        
    }
    
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
