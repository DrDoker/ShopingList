//
//  AddNewItemView.swift
//  ShopingList
//
//  Created by Serhii on 09.01.2025.
//

import SwiftUI

struct AddNewItemView: View {
    @ObservedObject var viewModel: ShoppingListViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Add new item")
                    .padding(.top, 10)
                TextField("Name", text: $viewModel.newItemName)
                    .focused($isFocused)
                    .immediateKeyboard()
                    .accentColor(.yellow)
                Divider()
            }
            .padding()
        }
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    RoundActionButton(
                        icon: "arrow.up",
                        backgroundColor: .yellow,
                        isActive: viewModel.isActivieNewItemButton,
                        action: {
                            viewModel.addNewItem()
                        }
                    )
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .scrollDisabled(true)
        .onAppear {
            isFocused = true
        }
        .onDisappear {
            viewModel.newItemName = ""
        }
    }
}

#Preview {
    AddNewItemView(viewModel: ShoppingListViewModel())
}
