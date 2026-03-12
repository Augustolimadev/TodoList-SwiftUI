//
//  AppAlert.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 4/3/2026.
//

import Foundation

struct AppAlert {
    
    let title: String
    let message: String
    let actionBytton: ActionButton?
    
    init(title: String, message: String, actionButton: ActionButton? = nil) {
        
        self.title = title
        self.message = message
        self.actionBytton = actionButton
    }
}

extension AppAlert {
    
    struct ActionButton {
        let title: String
        let action: () -> ()
    }
}

extension AppAlert {
    
    static var mock1: Self {
        .init(
            title: "Sign Up Error",
            message: "Make sure all fields are completed before proceeding."
        )
    }
    
    static var mock2: Self {
        .init(
            title: "Sign Out",
            message: "Are you sure you want to sign out?",
            actionButton: .init(title: "Sign Out", action: { })
        )
    }
    
    static var empty: Self {
        .init(
            title: .empty,
            message: .empty
        )
    }
}
