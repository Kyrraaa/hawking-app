//
//  ToolBarView.swift
//  hawking-app
//
//  Created by Laurine Pereira on 13/04/2023.
//

import SwiftUI

struct ToolBarView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(self.title)
                .bold()
            Divider()
                .padding(.horizontal, 10)
        }.frame(width: UIScreen.main.bounds.width)
    }
}
