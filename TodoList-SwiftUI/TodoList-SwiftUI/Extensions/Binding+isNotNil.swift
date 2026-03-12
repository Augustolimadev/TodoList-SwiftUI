//
//  Binding+isNotNil.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 11/3/2026.
//

import SwiftUI

extension Binding {
    
    func isNotNil<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        .init {
            wrappedValue != nil
        } set: {
            if !$0 { wrappedValue = nil }
        }
    }
    
//    func isNotNil<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
//        
//        Binding<Bool>(
//            get: { wrappedValue != nil },
//            set: { newValue in
//                if !newValue {
//                    wrappedValue = nil
//                }
//            }
//        )
//    }
}
