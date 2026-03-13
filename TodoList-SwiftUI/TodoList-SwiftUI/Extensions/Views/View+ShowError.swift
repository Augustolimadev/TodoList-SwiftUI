//
//  
//  View+ShowError.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 12/3/2026.
//
//

import SwiftUI

extension View {

    func showError(item: Binding<Error?>) -> some View {
        showModal(item: item) { error in
            ErrorView(error: item)
                .transition(
                    .move(edge: .bottom)
                    .combined(with: .opacity)
                )
        }
    }
}

fileprivate struct PreviewView: View {
    
    @State private var error: Error?
    
    var body: some View {
        Text("Show Error")
            .primaryButton()
            .button(.press) {
                error = AuthError.mock
            }
            .padding()
            .infinityFrame()
            .background(.viewBackground)
            .showError(item: $error)
    }
}

#Preview {
    PreviewView()
}
