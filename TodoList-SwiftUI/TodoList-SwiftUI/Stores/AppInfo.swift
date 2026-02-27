//
//  AppInfo.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 27/2/2026.
//

import Foundation

final class AppInfo {
    
    let developer: String = "Augusto Lima"
    var version: String { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-" }
    
    var compatibilityVersion: String {
        
        if let minVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            "iOS \(minVersion)"
        } else {
            "-"
        }
    }
}
