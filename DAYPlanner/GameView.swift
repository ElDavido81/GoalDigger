//
//  GameView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI

struct GameView: View {
    
    @Binding var blurGridLayer: Bool

    var body: some View {
        
        HStack{
MenuView(blurGridLayer: $blurGridLayer)
                .frame(width: 50)
            
            VStack{
                
            HStack(){
                Rectangle()
                    .foregroundStyle(Color.gray)
                    .frame(width: 80, height: 200)
                
                VStack{
                    HStack {
                        ForEach(months, id: \.self) {month in
                            VStack{
                                GameMonthView()
                                
                                let month = month
                                let monthCaps = month.uppercased()
                                let monthLetter = monthCaps.prefix(1)
                                
                                Text("\(monthLetter)")
                                    .padding(12)
                                    .frame(maxWidth: .infinity)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.gray)
                                    .background(Color.gray.opacity(0.8))
                                    .opacity(0.3)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)

                }
                .padding(.vertical)
                
                Spacer()
            }
                GamePointsView()
                    .frame(maxWidth: .infinity)
        }
            
            LadderView()
            
            
        }
        .background(Color.black.opacity(0.9))




    }
}

#Preview {
    GameView(blurGridLayer: .constant(false))
}
