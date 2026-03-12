//
//  ErrorDisplayable.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 4/3/2026.
//

import Foundation

@MainActor
protocol ErrorDisplayable: AnyObject {
    var error: Error? { get set }
}
