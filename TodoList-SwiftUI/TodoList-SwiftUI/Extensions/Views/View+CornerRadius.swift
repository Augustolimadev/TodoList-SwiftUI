//
//  View+CornerRadius.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 3/3/2026.
//

import SwiftUI

struct AppCornerRadius {
    let value: CGFloat
}

extension View {
    
    func cornerRadius(_ radius: AppCornerRadius) -> some View {
        cornerRadius(radius.value)
    }
}

extension AppCornerRadius {
    static var overall: Self = .init(value: 8)
    static var cell: Self = .init(value: 8)
    static var button: Self = .init(value: 8)
    static var textField: Self = .init(value: 8)
}

fileprivate struct Preview: View {
    
    var body: some View {
        Text("Calculate")
        .foregroundStyle(Color.appTheme.accentContrastText)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.appTheme.accent)
        .cornerRadius(.button)
        .button(.press) {
            
        }
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
    }
}

#Preview {
    Preview()
}
