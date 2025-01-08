//
//  ShopingListViewModel.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import Foundation

class ShopingListViewModel: ObservableObject {
    @Published var itemsList: [Item] = [Item(name: "Item 1"), Item(name: "Item 2"), Item(name: "Item 3"), Item(name: "Item 4", isCompleted: true)]
    
    func calculateProgress() -> Double {
        let completedItems = itemsList.filter { $0.isCompleted }.count
        let totalItems = itemsList.count
        return totalItems > 0 ? Double(completedItems) / Double(totalItems) : 0
    }
    
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            itemsList.remove(at: index)
        }
    }
}
