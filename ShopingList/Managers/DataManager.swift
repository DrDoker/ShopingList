//
//  DataManager.swift
//  ShopingList
//
//  Created by Serhii on 09.01.2025.
//

import SwiftData
import Foundation

final class DataManager {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = DataManager()

    @MainActor
    private init() {
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Item.self
            ])
            let modelConfiguration = ModelConfiguration(
                schema: schema,
                isStoredInMemoryOnly: false
            )

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        self.modelContainer = sharedModelContainer
        self.modelContext = modelContainer.mainContext
    }
    
    func saveItem(_ item: Item) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func update() {
        saveContext()
    }
    
    func deleteItem(_ item: Item) {
        modelContext.delete(item)
        saveContext()
    }
    
    func fetchItems() -> [Item] {
        do {
            let fetchDescriptor = FetchDescriptor<Item>()
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteAllItems() {
        let items = fetchItems()
        items.forEach { modelContext.delete($0) }
        saveContext()
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save data.")
        }
    }
}
