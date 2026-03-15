//
//  UserStore.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 14/3/2026.
//

import Foundation
import FirebaseFirestore

@MainActor
final class UserStore: UserStoreProtocol {
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: User) throws {
        try userDocument(userId: user.userId).setData(from: user)
    }
    
    func getUser(userId: String) async throws -> User {
        try await userDocument(userId: userId).getDocument(as: User.self)
    }
}
