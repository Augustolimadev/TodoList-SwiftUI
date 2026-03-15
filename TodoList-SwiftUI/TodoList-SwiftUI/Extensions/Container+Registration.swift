//
//  Container+Registration.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 26/2/2026.
//

import Factory

extension Container {
    
    var appInfoStore: Factory<AppInfo> {
        self { MainActor.assumeIsolated { AppInfo() }}.singleton
    }
    
    var authStore: Factory<any AuthStoreProtocol> {
        self { MainActor.assumeIsolated { AuthStore() }}.singleton
    }
    
    var userStore: Factory<any UserStoreProtocol> {
        self { MainActor.assumeIsolated { UserStore() }}.singleton
    }
}
