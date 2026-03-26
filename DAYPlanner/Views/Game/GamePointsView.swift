//
//  GamePointsView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-05.
//

import SwiftUI

let gemColors: [Color] = [.blue, .green, .purple, .pink, .orange]

struct GamePointsView: View {
    

    var body: some View {

        HStack(spacing: 0){
            AddTaskButtonView()
            Rectangle()
                .frame(width: 10)
                .opacity(0)
//            AddTaskButtonView()
//            Rectangle()
//                .frame(width: 20)
//                .opacity(0)
            ForEach (gemColors, id: \.self) {index in
                GamePointsDetailsView(gemColor: index)
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
            }
            Spacer()
            Text("250000")
                .foregroundStyle(Color.gray)
                .fontWeight(.bold)
                .font(.system(size: 35))
            Rectangle()
                .frame(width: 5)
                .opacity(0)
        }

    }
}

#Preview {
//    GamePointsView()
}
