//
//  User.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 13/3/2026.
//

import Foundation
import FirebaseFirestore

struct User {
    
    public var userId: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var dateCreated: Timestamp?
    
    init(userId: String, firstName: String, lastName: String, email: String, dateCreated: Timestamp?) {
        
        self.userId = userId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateCreated = dateCreated
    }
}

extension User {
    
    static var empty: Self {
        .init(userId: .empty, firstName: .empty, lastName: .empty, email: .empty, dateCreated: nil)
    }
    
    static var mock: Self {
        .init(userId: "mock_augusto_id",
              firstName: "Augusto",
              lastName: "Lima",
              email: "augusto@email.com",
              dateCreated: .init())
    }
}

extension User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case dateCreated = "date_created"
    }
}
