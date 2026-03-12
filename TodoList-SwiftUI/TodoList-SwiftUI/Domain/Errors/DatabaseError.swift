//
//  DatabaseError.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import Foundation
import FirebaseFirestore

enum DatabaseError: LocalizedError {
    
    case missingFields
    case documentNotFound
    case permissionDenied
    case networkError
    case unknown(Error)
}

extension DatabaseError: AppError {
    
    var title: String {
        "Todo Error"
    }
    
    var message: String {
        
        switch self {
        case .missingFields:
            "Some required fields are missing. Please complete all the fields."
        case .documentNotFound:
            "The requested todo item was not found."
        case .permissionDenied:
            "You do not have permission to perform this action."
        case .networkError:
            "A network error occurred. Check your internet connectio and try again later."
        case .unknown(let error):
            error.localizedDescription
        }
    }
}

extension DatabaseError {
    
    static func fromFirebaseError(_ error: NSError) -> any AppError {
        
        guard let errorCode = FirestoreErrorCode.Code(rawValue: error.code) else {
            return AuthError.unknown(error)
        }
        
        return switch errorCode {
        case .notFound:
            DatabaseError.documentNotFound
        case .permissionDenied:
            DatabaseError.permissionDenied
        case .unavailable, .deadlineExceeded:
            DatabaseError.networkError
        default:
            DatabaseError.unknown(error)
        }
    }
}
