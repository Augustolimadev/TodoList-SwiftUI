//
//  View+HideKeyboardOnTap.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import SwiftUI

extension View {
    
    func hideKeyboardOnTap() -> some View {
        
        onTapGesture {
            hideKeyboard()
        }
    }
}
