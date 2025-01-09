//
//  ItemsListCellView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct ItemsListCellView: View {
    let item: Item
    let action: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                action()
            }) {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.yellow)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text(item.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Item tapped: \(item.name)")
                }
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimensions in
            return dimensions[.leading]
        }
    }
}

#Preview {
    ItemsListCellView(item: Item(name: "Item", isCompleted: false)) {
        
    }
}
