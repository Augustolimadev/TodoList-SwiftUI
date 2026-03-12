//
//  AlertDisplayable.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 4/3/2026.
//

import Foundation

@MainActor
protocol AlertDisplayable: AnyObject {
    var alert: AppAlert? { get set }
}
