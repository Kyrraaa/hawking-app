//
//  PlayerStatisticsView.swift
//  hawking-app
//
//  Created by Laurine Pereira on 13/04/2023.
//

import SwiftUI

struct PlayerStatisticsView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    
    private var gridItemLayout = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    var body: some View {
        if let player = self.playerViewModel.player {
            VStack(spacing: 50) {
                Spacer()
                VStack {
                    Text(player.username)
                        .font(.system(size: 30))
                        .fontWeight(.regular)
                    
                    Text("(\(player.uuid))")
                        .italic()
                        .font(.system(size: 15))
                        .fontWeight(.light)
                    
                }
                
                ScrollView {
                    LazyVGrid(columns: gridItemLayout) {
                        if let authorizedBlocks = player.authorizedBlocks {
                            ForEach(authorizedBlocks) { authorizedBlock in
                                StatisticsCard(
                                    blockIdentifier: authorizedBlock.identifier,
                                    blockCount: authorizedBlock.block.count
                                )
                            }
                        }
                    }
                    .padding(3)
                }
                .frame(width: 350, height: 400)
                .cornerRadius(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.1))
                )
                Spacer()
            }
        }
    }
}

struct StatisticsCard: View {
    var blockIdentifier: String
    var blockCount: Int
    
    var body: some View {
        VStack(spacing: 2) {
            Image(self.blockIdentifier)
                .resizable()
                .frame(width: 64, height: 64)
            Text("\(self.blockCount)")
                .font(.system(size: 20))
                .fontWeight(.regular)
        }
    }
}
