//
//  GemStone.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-06.
//

import SwiftUI

struct GemStone: View {

    let gemColor: Color
    var body: some View {
        ZStack(alignment: .topLeading){

        
        Rectangle()
            .cornerRadius(10)
            .foregroundStyle(
                LinearGradient(
                    colors: [.white.opacity(0.7), gemColor],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
            )
            .frame(width: 25, height: 25)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding(3)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 2)
                )
            Rectangle()
                .foregroundStyle(LinearGradient(
                    colors: [.white, gemColor],
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                ))
                .cornerRadius(6)
                .frame(width: 15, height: 15)
                .offset(x: 8, y: 8)
        }
     
    }
}
            
