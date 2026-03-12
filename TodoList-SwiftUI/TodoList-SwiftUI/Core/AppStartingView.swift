//
//  AppStartingView.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 25/2/2026.
//

import SwiftUI
import Factory

struct AppStartingView: View {
    
    @StateObject private var viewModel: AppStartingViewModel = .init()
    
    var body: some View {
        
        Group {
            
            switch viewModel.appState {
            case .auth:
                AuthView()
            case .app:
                NavigationStack {
                    Text("App")
                }
            }
        }.animation(.spring, value: viewModel.appState)
    }
}

#Preview {
    AppStartingView()
}
