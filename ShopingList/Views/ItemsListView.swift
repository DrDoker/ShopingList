//
//  ItemsListView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct ItemsListView: View {
    @ObservedObject var viewModel: ShoppingListViewModel
    
    var body: some View {
        List {
            // MARK: - New Items Section
            Section {
                if viewModel.areAllItemsCompleted {
                    EmptyActiveItemsView()
                        .listRowSeparator(.hidden)
                } else {
                    ForEach(viewModel.activeItems) { item in
                        ItemsListCellView(item: item) {
                            withAnimation {
                                viewModel.updateItem(item)
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            deleteButton(for: item)
                        }
                    }
                }
            }
            
            // MARK: - Completed Items Section
            if !viewModel.completedItems.isEmpty {
                Section(
                    header: CompletedItemsHeaderView(isExpanded: $viewModel.isCompletedItemsExpanded)
                ) {
                    if viewModel.isCompletedItemsExpanded {
                        ForEach(viewModel.completedItems) { item in
                            ItemsListCellView(item: item) {
                                withAnimation {
                                    viewModel.updateItem(item)
                                }
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                deleteButton(for: item)
                            }
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .confirmationDialog(
            "Delete Item",
            isPresented: $viewModel.showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            deleteConfirmationButtons
        } message: {
            Text("Are you sure you want to delete this item?")
        }
    }
}

extension ItemsListView {
    // MARK: - Delete Button
    private func deleteButton(for item: Item) -> some View {
        Button {
            viewModel.initiateItemDeletion(item)
        } label: {
            Image(systemName: "trash")
        }
        .tint(.red)
    }
    
    // MARK: - Delete Confirmation Buttons
    private var deleteConfirmationButtons: some View {
        Group {
            Button("Delete", role: .destructive) {
                withAnimation {
                    viewModel.deleteItem()
                }
                viewModel.cancelDeletion()
            }
            Button("Cancel", role: .cancel) {
                viewModel.cancelDeletion()
            }
        }
    }
}

#Preview {
    ItemsListView(viewModel: ShoppingListViewModel())
}
