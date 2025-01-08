//
//  ShopingListView.swift
//  ShopingList
//
//  Created by Serhii on 07.01.2025.
//

import SwiftUI

struct ShopingListView: View {
    @StateObject var viewModel = ShoppingListViewModel()
    
    var body: some View {
        VStack {
            ProgressBar(value: viewModel.calculateProgress())
                .frame(height: 6)
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            ItemsListView(viewModel: viewModel)
        }
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    RoundActionButton(
                        icon: "plus",
                        backgroundColor: .yellow,
                        action: {
                            print("Add new item")
                        }
                    )
                    .padding()
                    .padding(.trailing, 30)
                }
            }
        )
        .shoppingListToolbar(
            barTitle: "Shopping List",
            showBackButton: false
        )
    }
}

#Preview {
    ShopingListView()
}
