//
//  HackView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-26.
//

import SwiftUI

struct HackView: View {
    var body: some View {
        
        
        ZStack{
            
            VStack(spacing: 0){
                Rectangle()
                    .fill(Color(hex:"5c3d0a"))
                    .cornerRadius(10)
                    .frame(width: 20, height: .infinity)
                Spacer()
            }
            
            
            
            VStack(spacing: 0){
                Rectangle()
                    .fill(.clear)
                    .frame(height: 8)
                Rectangle()
                    .fill(Color(hex:"a3a3a3"))
                    .cornerRadius(10)
                    .frame(width: .infinity, height: 18)
                Spacer()
            }
            
            
            VStack(spacing: 0){

                ZStack{
                    Rectangle()
                        .fill(Color(hex: "ffe8b8"))
                        .frame(width: 5, height: 35)
                        .clipShape(RoundedCorners(radius: 10,
                                    corners: [.bottomRight, .topLeft]))
                        .rotationEffect(Angle(degrees: 50))
                    Rectangle()
                        .fill(Color(hex: "ffe8b8"))
                        .frame(width: 5, height: 35)
                        .clipShape(RoundedCorners(radius: 10,
                                    corners: [.bottomLeft, .topRight]))
                        .rotationEffect(Angle(degrees: -50))
                }
                Spacer()
            }
        }
        
        
        
    }
}

#Preview {
    HackView()
}
