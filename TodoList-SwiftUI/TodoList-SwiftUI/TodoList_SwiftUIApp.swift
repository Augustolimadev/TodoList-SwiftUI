//
//  TodoList_SwiftUIApp.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 25/2/2026.
//

import SwiftUI
import FirebaseCore

@main
struct TodoList_SwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AppStartingView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
