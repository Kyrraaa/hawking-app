//
//  hawking_appApp.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import SwiftUI

@main
struct HawkingApp: App {
    @StateObject private var playerViewModel = PlayerViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(playerViewModel)
        }
    }
}
