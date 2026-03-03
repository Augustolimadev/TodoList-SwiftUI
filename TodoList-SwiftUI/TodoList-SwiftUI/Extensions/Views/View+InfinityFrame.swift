//
//  View+InfinityFrame.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 3/3/2026.
//

import SwiftUI

extension View {
    
    func infinityFrame() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
