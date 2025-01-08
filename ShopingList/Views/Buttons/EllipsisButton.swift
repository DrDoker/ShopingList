//
//  EllipsisButton.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//


import SwiftUI

struct EllipsisButton: View {
    var onEdit: (() -> Void)?
    var onShare: (() -> Void)?
    var onDelete: (() -> Void)?

    var body: some View {
        Menu {
            if let onEdit = onEdit {
                menuButton(action: onEdit, imageName: "pencil", name: "Edit", textColor: .black)
            }
            if let onShare = onShare {
                menuButton(action: onShare, imageName: "square.and.arrow.up", name: "Share", textColor: .black)
            }
            if let onDelete = onDelete {
                menuButton(action: onDelete, imageName: "trash", name: "Delete", textColor: .red, role: .destructive)
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(.yellow)
                .frame(width: 24, height: 24)
        }
    }

    private func menuButton(action: @escaping () -> Void, imageName: String, name: String, textColor: Color, role: ButtonRole? = nil) -> some View {
        Button(role: role, action: action) {
            HStack {
                Image(systemName: imageName)
                    .frame(width: 16, height: 16)
                    .foregroundColor(textColor)
                Text(name)
                    .foregroundColor(textColor)
            }
        }
    }
}
