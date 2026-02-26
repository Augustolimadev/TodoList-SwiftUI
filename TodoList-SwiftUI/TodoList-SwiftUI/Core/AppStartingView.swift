//
//  AppStartingView.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 25/2/2026.
//

import SwiftUI

struct AppStartingView: View {
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    AppStartingView()
}
