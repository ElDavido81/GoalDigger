//
//  GamePointsGemView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-05.
//

import SwiftUI

struct GamePointsDetailsView: View {
    var body: some View {
        
            
        HStack{
                Rectangle()
                    .cornerRadius(10)
                    .foregroundStyle(Color.yellow)
                    .frame(width: 30, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                        )
                    .padding(3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.white, lineWidth: 3)
                    )
            VStack{
                Spacer()
                    Text(" x")
                    .foregroundStyle(Color.gray)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                Spacer()
            }
            .fixedSize()
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


#Preview {
    GamePointsDetailsView()
}
