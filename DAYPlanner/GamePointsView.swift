//
//  GamePointsView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-05.
//

import SwiftUI

let gemColors: [Color] = [.orange, .blue, .green, .red]

struct GamePointsView: View {
    var body: some View {

        HStack(spacing: 0){
            ForEach (gemColors, id: \.self) {index in
                GamePointsDetailsView(gemColor: index)
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
            }
            Spacer()
            Text("250000")
                .foregroundStyle(Color.gray)
                .fontWeight(.regular)
                .font(.system(size: 25))
            Rectangle()
                .frame(width: 5)
                .opacity(0)
        }

    }
}

#Preview {
    GamePointsView()
}
