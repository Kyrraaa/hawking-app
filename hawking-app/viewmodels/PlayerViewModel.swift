//
//  PlayerInformationViewModel.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    let provider: DataProvider = DataProvider()
    @Published var player: Player?
    @Published var displaySearchView: Bool = true
    @Published var error: HawkingError?
    
    func getPlayerStatistics(for username: String) -> Void {
        provider.getPlayerStatistics(for: username, { result in
            switch result {
            case .failure(let error):
                self.error = error
            case .success(let player):
                self.player = player
                self.displaySearchView = false
            }
        })
    }
}
