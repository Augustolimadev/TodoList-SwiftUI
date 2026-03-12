//
//  AppStartingViewModel.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 2/3/2026.
//

import SwiftUI
import Combine
import Factory

@MainActor
final class AppStartingViewModel: ObservableObject {
    
    @Published var appState: AppState = .auth
    @Injected(\.authStore) var authStore
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        updateAppState()
        setSubscribers()
    }
}

private extension AppStartingViewModel {
    
    func setSubscribers() {
        
        authStore.authUpdatePublisher
//            .receive(on: DispatchQueue.main) my classe is already in the MainThread
            .sink { [weak self] _ in
                guard let self else { return }
                updateAppState()
            }
            .store(in: &cancellables)
    }
    
    func getAppState() -> AppState {
        authStore.getAuthenticatedUser() == nil ? .auth : .app
    }
    
    func updateAppState() {
        
        let currentAppState = getAppState()
        
        if appState != currentAppState {
            appState = currentAppState
        }
    }
}
