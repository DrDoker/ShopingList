//
//  CompletedItemsHeaderView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct CompletedItemsHeaderView: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack {
            Text("Completed Items")
            
            Spacer()
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CompletedItemsHeaderView(isExpanded: .constant(true))
}
