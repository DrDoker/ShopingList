//
//  MainTabView.swift
//  ShopingList
//
//  Created by Serhii on 07.01.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ShopingListView()
            }
            .tabItem {
                Label("Shoping List", systemImage: "checklist")
            }
        }
        .accentColor(.yellow)
    }
}

#Preview {
    MainTabView()
}
