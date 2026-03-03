//
//  View+Colors.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 2/3/2026.
//

import SwiftUI

extension Color {
    static var appTheme: AppColorTheme = main
}

extension Color {
    
    static var main: AppColorTheme {
        .init(
            accent: .accent,// .init(.accent),
            alternateAccent: .alternateAccent,
            viewBackground: .viewBackground,
            cellBackground: .cellBackground,
            text: .text,
            secondaryText: .secondaryText,
            alternateText: .alternateText,
            accentContrastText: .accentContrastText,
            primaryAction: .primaryAction,
            neutralAction: .neutralAction,
            destructive: .destructive,
            success: .success,
            warning: .warning,
            info: .info,
            error: .error,
            inProgress: .inProgress,
            divider: .divider,
            miscellaneous: .miscellaneous
        )
    }
}

struct AppColorTheme {
    
    let accent: Color
    let alternateAccent: Color
    let viewBackground: Color
    let cellBackground: Color
    let text: Color
    let secondaryText: Color
    let alternateText: Color
    let accentContrastText: Color
    let primaryAction: Color
    let neutralAction: Color
    let destructive: Color
    let success: Color
    let warning: Color
    let info: Color
    let error: Color
    let inProgress: Color
    let divider: Color
    let miscellaneous: Color
}

fileprivate struct Preview: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("Title")
                    .foregroundColor(.appTheme.text)
                Text("Subtitle")
                    .foregroundColor(.appTheme.secondaryText)
            }
            
            Divider()
                .foregroundColor(.appTheme.divider)
                .padding(.horizontal)
            
            Button { } label: {
                Text("Get started")
                    .padding()
                    .background(Color.appTheme.accent)
                    .cornerRadius(8.0)
                    .foregroundColor(.appTheme.accentContrastText)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appTheme.viewBackground)
    }
}

#Preview("Light Mode") {
    Preview()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    Preview()
        .preferredColorScheme(.dark)
}
