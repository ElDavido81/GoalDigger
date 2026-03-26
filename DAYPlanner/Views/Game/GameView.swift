//
//  GameView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI

struct GameView: View {
    
    
    @State private var hackAngle: Angle = Angle(degrees: -15)
    
    
    var body: some View {
        
        
        VStack{
            HStack {
                LiquidView()
                    .frame(width: 50)
Rectangle()
                    .fill(.clear)
                    .frame(width: 5)
                
                VStack(spacing: 0){
                    Spacer()
                    HackView()
                        .frame(width: 50, height: 100)
                        .onTapGesture {
                            hackAngle = Angle(degrees: 15)
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                                hackAngle = Angle(degrees: -15)
                            }
                        }
                        .rotationEffect(hackAngle)
                    
                }
                
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
                LadderView()
            }
            .frame(maxWidth: .infinity)
            
            GamePointsView()
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical)
        
        
        .background(Color.black.opacity(0.9))
        
        
        
        
    }
}

#Preview {
    GameView()
}
