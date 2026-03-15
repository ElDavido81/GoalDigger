//
//  GameMonthView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI

let testlista = [
    5, 0, 5, 10, 0, 5, 0, 5, 10, 5, 0, 10, 0, 10, 5
]

struct GameMonthView: View {
        
    var body: some View {
                
        VStack{            
            VStack(spacing: 0){
                ForEach(testlista, id: \.self) { index in
                    Spacer(minLength: 8)
                GameRockView(value: index)
//                    GemStone(value: index)
                }
            }
        }
        .frame(maxHeight: 250, alignment: .bottom)

        }

    }


#Preview {
    GameMonthView()
}
