//
//  View+ShowModel.swift
//  TodoList-SwiftUI
//
//  Created by Augusto Lima on 11/3/2026.
//

import SwiftUI

struct ModalSupport<ModalContent: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    @ViewBuilder let modalContent: () -> ModalContent
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
            
            if isPresented {
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
                    .transition(.opacity.animation(.smooth))
                    .onTapGesture(perform: {
                        isPresented = false
                    })
                modalContent()
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}

extension View {
    
    func showModal(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> some View) -> some View {
        
        modifier(ModalSupport(isPresented: isPresented) {
            content()
        })
    }
    
    func showModal<Item>(item: Binding<Item?>, @ViewBuilder content: @escaping (Item) -> some View) -> some View {
        
        modifier(ModalSupport(isPresented: item.isNotNil()) {
            if let value = item.wrappedValue {
                content(value)
            }
        })
    }
}

fileprivate struct PreviewView: View {
    
    @State private var isPresented: Bool = false
    @State private var item: Int? = nil
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Show Modal - isPresenter")
                .primaryButton()
                .button(.press) {
                    showModalUsingPresented()
                }
            
            Text ("Show Modal - item")
                .primaryButton()
                .button(.press) {
                    showModalUsingItem()
                }
        }
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
        .showModal(item: $item) { data in
            PreviewModalContentView()
                .transition(.move(edge: .leading))
        }
        .showModal(isPresented: $isPresented) {
            PreviewModalContentView()
                .transition(.move(edge: .bottom))
        }
    }
    
    private func showModalUsingPresented() {
        
        item = nil
        isPresented = true
    }
    
    private func showModalUsingItem() {
        
        isPresented = false
        item = Int.random(in: 1...10)
    }
}

fileprivate struct PreviewModalContentView: View {
    
    var body: some View {
        
        Text("Modal Content")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.accent)
            .frame(width: 300, height: 250)
            .background(.viewBackground)
            .cornerRadius(.overall)
    }
}

#Preview {
    PreviewView()
}
