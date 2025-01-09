//
//  ShoppingListViewModel.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import Foundation

@MainActor
class ShoppingListViewModel: ObservableObject {
    @Published var itemsList: [Item] = []
    @Published var isCompletedItemsExpanded = true
    @Published var showDeleteConfirmation = false
    @Published var itemToDelete: Item?
    @Published var newItemName = ""
    @Published var showNewItemSheet = false
    
    private let dataManager = DataManager.shared
    
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
    
    func fetchItems() {
        itemsList = dataManager.fetchItems()
    }
    
    func addNewItem() {
        let item = Item(name: newItemName)
        dataManager.saveItem(item)
        newItemName = ""
        fetchItems()
    }
    
    func toggleItemCompletion(_ item: Item) {
        item.isCompleted.toggle()
        dataManager.update()
        fetchItems()
    }
    
    func initiateItemDeletion(_ item: Item) {
        itemToDelete = item
        showDeleteConfirmation = true
    }
    
    func cancelDeletion() {
        itemToDelete = nil
    }
    
    func deleteItem() {
        if let item = itemToDelete {
            dataManager.deleteItem(item)
            fetchItems()
        }
    }
    
    func calculateProgress() -> Double {
        let completedItems = itemsList.filter { $0.isCompleted }.count
        let totalItems = itemsList.count
        return totalItems > 0 ? Double(completedItems) / Double(totalItems) : 0
    }
}
