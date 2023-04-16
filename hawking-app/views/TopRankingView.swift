//
//  TopRankingView.swift
//  hawking-app
//
//  Created by Laurine Pereira on 13/04/2023.
//

import SwiftUI

struct TopRankingView: View {
    var body: some View {
        VStack {
            VStack{
                HStack {
                    ZStack {
                        VStack {
                            Text("2")
                                .bold()
                            Text("Username")
                        }
                    }.padding(.top, 80)
                    ZStack {
                        VStack {
                            Text("1")
                                .bold()
                            Text("Username")
                        }
                        
                    }.padding(.bottom, 80)
                    ZStack {
                        VStack {
                            Text("3")
                                .bold()
                            Text("Username")
                        }
                    }.padding(.top, 80)
                }
                .padding(.vertical, 50)
                .padding(.horizontal)
                .border(.white)
            }
            VStack{
                HStack{
                    Text("Username")
                    Spacer()
                    Text("4")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("5")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("6")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("7")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("8")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("9")
                }
                HStack{
                    Text("Username")
                    Spacer()
                    Text("10")
                }
            }
            Spacer()
        }
    }
}
