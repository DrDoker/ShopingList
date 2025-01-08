//
//  ItemListCellView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct ItemListCellView: View {
    let item: Item
    let action: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                action()
            }) {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .imageScale(.large)
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
    ItemListCellView(item: Item(name: "Item", isCompleted: false)) {
        
    }
}
