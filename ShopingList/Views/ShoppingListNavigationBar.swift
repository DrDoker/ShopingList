//
//  ShoppingListNavigationBar.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

extension View {
    func shoppingListToolbar(
        barTitle: String = "",
        showBackButton: Bool = true,
        dismissAction: (() -> Void)? = nil
    ) -> some View {
        self.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(barTitle)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
            }
            .toolbar {
                if showBackButton, let dismissAction = dismissAction {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: dismissAction) {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 24)
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
    }
}
