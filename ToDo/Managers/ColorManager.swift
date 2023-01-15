//
//  ColorManager.swift
//  ToDo
//
//  Created by Brandon Rodriguez on 1/10/23.
//

import Foundation

enum ColorManager: String,  CaseIterable, Identifiable {
    
    case red = "Red"
    case pink = "Pink"
    case purple = "Purple"
    case green = "Green"
    case blue = "Blue"
    case cyan = "Cyan"
    case yellow = "Yellow"
    case orange = "Orange"
    
    var id: RawValue { rawValue }
    
}
