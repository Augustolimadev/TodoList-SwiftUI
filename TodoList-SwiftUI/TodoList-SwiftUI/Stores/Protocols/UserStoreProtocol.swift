//
//  UserStoreProtocol.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 13/3/2026.
//

import Foundation

protocol UserStoreProtocol {
    func createNewUser(user: User) throws
    func getUser(userId: String) async throws -> User
}
