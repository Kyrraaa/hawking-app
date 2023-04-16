//
//  HomeView.swift
//  hawking-app
//
//  Created by Laurine Pereira on 13/04/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            NavigationStack {
                SearchPlayerView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar { ToolBarView(title: "Player statistics") }
            }.tabItem {
                Label("Statistics", systemImage: "plus.forwardslash.minus")
            }.tag(1)
            
            NavigationStack {
                TopRankingView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar { ToolBarView(title: "Top 10") }
            }.tabItem {
                Label("Top 10", systemImage: "trophy")
            }.tag(2)
        }
    }
}
