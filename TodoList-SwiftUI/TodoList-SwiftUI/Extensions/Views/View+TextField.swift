//
//  View+TextField.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 4/3/2026.
//

import SwiftUI

extension View {
    
    func textField(sfSymbol: String, resetAction: ( () -> () )? = nil) -> some View {
        
        HStack(spacing: 5) {
            Image(systemName: sfSymbol)
                .frame(width: 30)
            
            self
            if let resetAction {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(Color.appTheme.destructive)
                    .button {
                        resetAction()
                    }
            }
        }
        .foregroundStyle(Color.appTheme.accent)
        .padding(12)
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.textField)
    }
}
