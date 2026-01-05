//
//  GamePointsView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-05.
//

import SwiftUI

struct GamePointsView: View {
    var body: some View {

        HStack(spacing: 0){
            ForEach (0..<3) {index in
                GamePointsDetailsView()
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
