//
//  RoundActionButton.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//


import SwiftUI

struct RoundActionButton: View {
    var icon: String
    var backgroundColor: Color = .yellow
    var isActive: Bool?
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
            }
            .frame(width: 50, height: 50)
            .foregroundColor(
                Color(.black)
            )
            .background(
                (isActive ?? true)
                ? backgroundColor
                : .secondary)
            .cornerRadius(25)
        }
        .disabled(!(isActive ?? true))
    }
}

#Preview {
    let action: (() -> Void)? = {}
    return RoundActionButton(
        icon: "plus",
        backgroundColor: .yellow,
        action: action
    )
}
