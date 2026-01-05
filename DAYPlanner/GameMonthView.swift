//
//  GameMonthView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI

let testlista2 = [
    5, 0, 5, 10, 0, 5, 0, 5, 10, 5, 0, 10, 0, 10, 5
]

struct GameMonthView: View {
        
    var body: some View {

        VStack(spacing: 3){
            
            ForEach(testlista2, id: \.self) { index in
                GameRockView(value: index)
                
            }
        }

    }
}

#Preview {
    GameMonthView()
}
