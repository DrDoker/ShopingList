//
//  ShoppingListViewModel.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    @Published var itemsList: [Item] = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3"),
        Item(name: "Item 4", isCompleted: true)
    ]
    @Published var isCompletedItemsExpanded = true
    @Published var showDeleteConfirmation = false
    @Published var itemToDelete: Item?
    @Published var newItemName = ""
    @Published var showNewItemSheet = false
    
    var isActivieNewItemButton: Bool {
        !newItemName.isEmpty
    }
    
    var activeItems: [Item] {
        itemsList.filter { !$0.isCompleted }
    }
    
    var completedItems: [Item] {
        itemsList.filter { $0.isCompleted }
    }
    
    var areAllItemsCompleted: Bool {
        itemsList.allSatisfy { $0.isCompleted }
    }
    
    func addNewItem() {
        let item = Item(name: newItemName)
        itemsList.append(item)
        newItemName = ""
    }
    
    func updateItem(_ item: Item) {
        if let index = itemsList.firstIndex(where: { $0.id == item.id }) {
            itemsList[index].isCompleted.toggle()
        }
    }
    
    func initiateItemDeletion(_ item: Item) {
        itemToDelete = item
        showDeleteConfirmation = true
    }
    
    func cancelDeletion() {
        itemToDelete = nil
    }
    
    func deleteItem() {
        if let item = itemToDelete, let index = itemsList.firstIndex(where: { $0.id == item.id }) {
            itemsList.remove(at: index)
        }
    }
    
    func calculateProgress() -> Double {
        let completedItems = itemsList.filter { $0.isCompleted }.count
        let totalItems = itemsList.count
        return totalItems > 0 ? Double(completedItems) / Double(totalItems) : 0
    }
}
