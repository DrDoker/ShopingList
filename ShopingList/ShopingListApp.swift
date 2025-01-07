//
//  ShopingListApp.swift
//  ShopingList
//
//  Created by Serhii on 07.01.2025.
//

import SwiftUI

@main
struct ShopingListApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
    }
}
