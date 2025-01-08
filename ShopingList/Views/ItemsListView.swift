//
//  ItemsListView.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import SwiftUI

struct ItemsListView: View {
    @ObservedObject var viewModel: ShopingListViewModel
    
    @State var isCompletedItemsExpanded: Bool = true
    
    var body: some View {
        List {
            // MARK: - New Item Section
            if viewModel.itemsList.map({ $0.isCompleted }).allSatisfy({ $0 }) {
                Section {
                    AllCompletedView()
                }
                .listRowSeparator(.hidden)
            } else {
                Section {
                    ForEach($viewModel.itemsList) { $item in
                        if !item.isCompleted {
                            ItemListCellView(item: $item)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteItem(at: indexSet)
                    }
                }
            }
            
            // MARK: - Completed Items Section
            Section(
                header: CompletedItemsHeaderView(isExpanded: $isCompletedItemsExpanded)
            ) {
                ForEach($viewModel.itemsList) { $item in
                    if isCompletedItemsExpanded {
                        if item.isCompleted {
                            ItemListCellView(item: $item)
                        }
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteItem(at: indexSet)
                }
            }
        }
        .listStyle(.plain)

    }
}

#Preview {
    ItemsListView(viewModel: ShopingListViewModel())
}
