//
//  GameView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-03.
//

import SwiftUI

struct GameView: View {
    var body: some View {

        HStack(spacing: 5){
            Rectangle()
                .foregroundStyle(Color.gray)
                .frame(width: 200, height: 500)
            
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
                            .foregroundStyle(Color.blue)
                            .background(Color.gray.opacity(0.5))
                            .opacity(0.3)
                    }
                    Spacer()

                }
            }
            .frame(maxWidth: .infinity)
                GamePointsView()
                .frame(maxWidth: .infinity)
            Spacer(minLength: 40)
        }
            
        .padding(.vertical)
        }
        .background(Color.black.opacity(0.9))

    }
}

#Preview {
    GameView()
}
