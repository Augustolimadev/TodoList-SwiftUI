//
//  
//  View+ShowAlert.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 12/3/2026.
//
//

import SwiftUI

extension View {
    
    func showAlert(item: Binding<AppAlert?>) -> some View {
        
        showModal(item: item) { alert in
            AlertView(alert: item)
                .transition(
                    .move(edge: .bottom)
                    .combined(with: .opacity)
                )
        }
    }
}

fileprivate struct PreviewView: View {
    
    @State private var alert: AppAlert?
    
    var body: some View {
        Text("Show Alert")
            .primaryButton()
            .button {
                alert = AppAlert.mock1
            }
            .padding()
            .infinityFrame()
            .background(.viewBackground)
            .showAlert(item: $alert)
    }
}

#Preview {
    PreviewView()
}
