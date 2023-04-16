//
//  SearchPlayerView.swift
//  hawking-app
//
//  Created by Laurine Pereira on 13/04/2023.
//

import SwiftUI

struct SearchPlayerView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @EnvironmentObject var playerViewModel: PlayerViewModel

    @State private var username: String = ""
    @State private var usernameIsEmpty: Bool = false

    var body: some View {
        if playerViewModel.displaySearchView {
            VStack(spacing: 30) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 3)
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 160)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
                
                TextField(text: $username, prompt: Text("Username")) {
                    Text("Username")
                }
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .background(Color.white.opacity(0.5).cornerRadius(10))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 50)
                
                Button {
                    usernameIsEmpty = username.isEmpty
                    if !usernameIsEmpty {
                        self.playerViewModel.getPlayerStatistics(for: username)
                    } else {
                        self.playerViewModel.error = HawkingError(message: "Username is required")
                    }
                } label: {
                    Text("Search")
                        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width / 2)
                        .font(.system(size: 18))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                        )
                }.background(.white.opacity(0))
                    .cornerRadius(25)
                
                if let error = playerViewModel.error {
                    Text(error.message)
                        .bold()
                        .foregroundColor(.red)
                }
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 2)
            }
        } else {
            PlayerStatisticsView()
                .refreshable {
                    self.playerViewModel.getPlayerStatistics(for: username)
                }
        }
    }
}
