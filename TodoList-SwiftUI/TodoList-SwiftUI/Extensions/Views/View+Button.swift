//
//  View+Button.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 3/3/2026.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.90 : 1)
            .animation(.smooth, value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

enum ButtonStyleOption {
    case press, plain
}

extension View {
    
    @ViewBuilder
    func button(_ option: ButtonStyleOption = .plain, action: @escaping() -> Void) -> some View {
        
        switch option {
        case .press:
            pressableButton(action: action)
        case .plain:
            plainButton(action: action)
        }
    }
    
    private func pressableButton(action: @escaping() -> Void) -> some View {
        
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    private func plainButton(action: @escaping() -> Void) -> some View {
        
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
}

fileprivate struct Preview: View {
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Text("Plain effect")
                .primaryButton()
                .button {
                    
                }
            Text("Press effect")
                .primaryButton()
                .button(.press) {
                    
                }
        }
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
    }
}

#Preview {
    Preview()
}
