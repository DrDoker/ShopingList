//
//  ItemsListCellView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct ItemsListCellView: View {
    @Environment(\.editMode) var editMode
    let item: Item
    let action: () -> Void
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.yellow)
                
                Text(item.name)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .alignmentGuide(.listRowSeparatorLeading) { dimensions in
                return dimensions[.leading]
            }
            
            Spacer()
            
            if editMode?.wrappedValue.isEditing ?? false {
                Button(action: {
                    action()
                }) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .symbolRenderingMode(.multicolor)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    ItemsListCellView(item: Item(name: "Item", isCompleted: false)) {
        
    }
}
