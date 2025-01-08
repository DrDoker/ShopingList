//
//  AllCompletedView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct EmptyActiveItemsView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 6) {
                Text("No items")

                Text("Add new items to the list")
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)

            Image(systemName: "bubbles.and.sparkles.fill")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.yellow)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyActiveItemsView()
}
