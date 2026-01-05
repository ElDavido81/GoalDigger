//
//  GameRockView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI


struct GameRockView: View {
    
    let value: Int
    
    func checkRockRadius(stoneValue: Int) -> CGFloat {
        var radius = 0.0
        if stoneValue > 9 {radius = 5.0}
        return radius
    }
    
    var body: some View {

        Rectangle()
            .cornerRadius(checkRockRadius(stoneValue: value))
            .foregroundStyle(Color.gray)
            .frame(minHeight: 35)

    }
}

//#Preview {
//    GameRockView()
//}
