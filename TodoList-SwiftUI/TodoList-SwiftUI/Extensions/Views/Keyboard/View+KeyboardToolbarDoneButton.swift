//
//  View+KeyboardToolbarDoneButton.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import SwiftUI

struct KeyboardToolbarDoneButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        content.hideKeyboard()
                    } label: {
                        Text("Done")
                            .foregroundStyle(Color.appTheme.accent)
                    }
                }
            }
    }
}

extension View {
    
    func keyboardToolbarDoneButton() -> some View {
        modifier(KeyboardToolbarDoneButtonModifier())
    }
}
