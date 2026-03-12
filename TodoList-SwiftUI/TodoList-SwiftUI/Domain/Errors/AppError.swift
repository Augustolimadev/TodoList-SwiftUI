//
//  AppError.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import Foundation

protocol AppError: LocalizedError {
    
    var title: String { get }
    var message: String { get }
    static func fromFirebaseError(_ error: NSError) -> AppError
}
