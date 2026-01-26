//
//  LiquidView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-23.
//

import SwiftUI

struct LiquidView: View {
    var body: some View {
        
//        GeometryReader { geometry in
            ZStack{
                
                
                
                ZStack{
                    Rectangle()
                        .fill(Color(hex:"c7c7c7"))
                        .clipShape(RoundedCorners(radius: 22, corners: [.bottomLeft, .bottomRight])) .clipShape(RoundedCorners(radius: 5, corners: [.topLeft, .topRight]))
                        .frame(width: 40, height: .infinity)
                    
                    VStack{
                        Ellipse()
                            .fill(Color(hex:"7d7d7d"))
                            .frame(width: 50, height: 18)
                            .overlay(
                                Ellipse()
                                    .stroke(Color(hex:"c7c7c7"), lineWidth: 5)
                                
                            )
                        Spacer()
                    }
                }
                
                VStack{
                    Spacer()
                        .frame(height: 100)
//                        .frame(height: geometry.size.height * 0.2)
                    
                    ZStack{
                        VStack{
                            Spacer()
                            Rectangle()
                                .fill(Color(hex: "3a9ff2"))
                                .clipShape(RoundedCorners(radius: 22, corners: [.bottomLeft, .bottomRight]))
                                .frame(width: 28, height: .infinity)
                            Spacer()
                        }
                        
                        VStack{
                            
                            Ellipse()
                                .fill(Color(hex: "3a9ff2"))
                                .frame(width: 28, height: 12)
                                .overlay(
                                    Ellipse()
                                        .stroke(Color(hex:"c7c7c7"), lineWidth: 4)
                                )
                            Spacer()
                        }
                    }
                }
                VStack(spacing:0){
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 150)
                    HStack(spacing: 0){
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 20)
                        Rectangle()
                            .fill(.white).opacity(0.2)
                            .frame(width: 8, height: .infinity)
                            .cornerRadius(20)
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 12)
                    }
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 15)
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            
//        }
        
    }
}

#Preview {
    LiquidView()
}
