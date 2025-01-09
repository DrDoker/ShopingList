//
//  Item.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import Foundation
import SwiftData

@Model
class Item: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}
