//
//  AllCompletedView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct AllCompletedView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("All items are completed")
                .foregroundColor(.gray)
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.yellow)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AllCompletedView()
}
