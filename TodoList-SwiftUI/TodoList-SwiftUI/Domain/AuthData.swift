//
//  AuthData.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 27/2/2026.
//

import FirebaseAuth

struct AuthData {
    
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
    
    init(email: String) {
        uid = UUID().uuidString
        self.email = email
    }
}

extension AuthData {
    
    static var mock: Self {
        .init(email: "augusto@test.com")
    }
}
