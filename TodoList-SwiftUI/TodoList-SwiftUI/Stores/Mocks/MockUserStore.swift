//
//  MockUserStore.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 14/3/2026.
//

import Foundation

@MainActor
final class MockUserStore: UserStoreProtocol {
    
    func createNewUser(user: User) throws { }
    
    func getUser(userId: String) async -> User {
        .mock
    }
}
