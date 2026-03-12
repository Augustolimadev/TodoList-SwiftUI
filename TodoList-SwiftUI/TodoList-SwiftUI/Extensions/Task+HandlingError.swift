//
//  Task+HandlingError.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 5/3/2026.
//

extension Task where Success == Void, Failure == Error {

    @MainActor
    @discardableResult
    init(priority: TaskPriority? = nil,
         handlingError viewModel: ErrorDisplayable,
         operation: @escaping () async throws -> Success) {
        
        self.init(priority: priority) {
            do {
                try await operation()
            } catch {
                viewModel.error = error
            }
        }
    }
}
