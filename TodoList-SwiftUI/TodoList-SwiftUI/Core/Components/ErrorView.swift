//
//  ErrorView.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 9/3/2026.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var error: Error?
    
    private var appError: AppError {
        error.asAppError()
    }
    
    var body: some View {
        VStack(spacing: 16) {
            headingView
            messageView
            understandButtonView
        }
        .padding()
        .background(.cellBackground)
        .cornerRadius(.cell)
        .frame(width: UIScreen.main.bounds.width / 1.2)
    }
}

private extension ErrorView {
    
    var headingView: some View {
        
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text(appError.title)
        }
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundStyle(.error)
    }
    
    var messageView: some View {
        
        Text(appError.message)
            .font(.body)
            .foregroundStyle(Color.appTheme.secondaryText)
            .multilineTextAlignment(.center)
    }
    
    var understandButtonView: some View {
        
        Text("Understood")
            .destructiveButton()
            .button {
                dismiss()
            }
    }
}

private extension ErrorView {
    
    func dismiss() {
        error = nil
    }
}

fileprivate struct Preview: View {
    
    @State private var error: Error? = AuthError.mock
    
    var body: some View {
        
        ErrorView(error: $error)
            .infinityFrame()
            .background(Color.appTheme.info)
    }
}

#Preview {
    Preview()
}
