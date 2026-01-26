//
//  GamePointsGemView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-05.
//

import SwiftUI


struct GamePointsDetailsView: View {

    let gemColor: Color
    
    var body: some View {
            
        HStack{
                GemStone(gemColor: gemColor)
            VStack{
                Text("50")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("x100")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 12))
            }

            }
        .frame(maxHeight: 30, alignment: .leading)
            .padding(10)
            .background(Color.white.opacity(0.2))
            .cornerRadius(12)
        }
        
    }

//
//#Preview {
//    GamePointsDetailsView()
//}
