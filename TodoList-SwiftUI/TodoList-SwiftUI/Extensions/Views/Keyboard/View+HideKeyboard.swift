//
//  View+HideKeyboard.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import SwiftUI

extension View {
    
    func hideKeyboard() {
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
