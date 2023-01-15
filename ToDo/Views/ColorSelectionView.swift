//
//  ColorSelectionView.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import SwiftUI

struct ColorSelectionView: View {
    
    @Binding var color: String
    
    private let colorColumns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text("Color Selection")
                .font(.title2)
                .foregroundColor(Color(Theme.text))
            
            LazyVGrid(columns: colorColumns, spacing: 10) {
                
                ForEach(ColorManager.allCases) { item in
                    
                    Button { color = item.rawValue } label: {
                        
                        ZStack {
                            
                            Color(item.rawValue)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(color: Color(item.rawValue).opacity(0.8), radius: 5)
                            
                            if item.rawValue == color {
                                
                                Image(systemName: Symbols.checkMark)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color(Theme.text))
                                    .frame(width: 30, height: 30)
                                
                            }
                            
                        }
                        
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityAddTraits(item.rawValue == color ? [.isButton, .isSelected] : .isButton)
                    .accessibilityLabel(LocalizedStringKey(item.rawValue))
                    
                }
                
            }
            .padding()
            .background(Color(Theme.detailBackground))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.8), radius: 5)
            
        }
        
    }
    
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView(color: .constant("Red"))
            .padding()
    }
}
