//
//  AuthError.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 6/3/2026.
//

import Foundation
import FirebaseAuth

enum AuthError: LocalizedError {
    
    case invalidCredentials
    case missingFields
    case userNotFound
    case emailAlreadyInUse
    case weakPassword
    case tooManyRequests
    case networkError
    case empty
    case unknown(Error)
}

extension AuthError: AppError {
    
    var title: String {
        "Authentication Error"
    }
    
    var message: String {
        
        switch self {
        case .invalidCredentials:
            "Invalid email or password."
        case .missingFields:
            "Please fill in all fields."
        case .userNotFound:
            "User not found."
        case .emailAlreadyInUse:
            "Email already in use."
        case .weakPassword:
            "Password is too weak. Try a stronger one."
        case .tooManyRequests:
            "You've made too many requests. Try again in a few minutes."
        case .networkError:
            "Network error. Check your internet connection."
        case .empty:
            .empty
        case .unknown(let error):
            error.localizedDescription
        }
    }
}

extension AuthError {
    
    static func fromFirebaseError(_ error: NSError) -> any AppError {
        
        guard let errorCode = AuthErrorCode(rawValue: error.code) else {
            return AuthError.unknown(error)
        }
        
        return switch errorCode {
            
        case .wrongPassword, .invalidEmail:
            AuthError.invalidCredentials
            
        case .userNotFound:
            AuthError.userNotFound
            
        case .emailAlreadyInUse:
            AuthError.emailAlreadyInUse
            
        case .weakPassword:
            AuthError.weakPassword
            
        case .tooManyRequests:
            AuthError.tooManyRequests
            
        case .networkError:
            AuthError.networkError
            
        default:
            AuthError.unknown(error)
        }
    }
}

extension AuthError {
    
    static var mock: Error {
        invalidCredentials
    }
}
