//
//  Item.swift
//  ShopingList
//
//  Created by Serhii on 08.01.2025.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool = false
}
