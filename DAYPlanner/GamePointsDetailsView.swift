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
//            VStack{
//                Spacer()
//                    Text(" x")
//                    .foregroundStyle(Color.gray)
//                    .fontWeight(.bold)
//                    .font(.system(size: 18))
//                Spacer()
//            }
//            .fixedSize()
                Text("50")
                    .foregroundStyle(Color.gray)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
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
