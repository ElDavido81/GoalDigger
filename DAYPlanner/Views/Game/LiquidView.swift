//
//  LiquidView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-23.
//

import SwiftUI

struct LiquidView: View {

    @EnvironmentObject var tm: TaskManager

    var body: some View {
        
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
                
                GeometryReader { geo in
                    let fullHeight = geo.size.height - 20
                    let safeLiquid = min(tm.lazyLiquid, 10)       // stoppar på 8
                    let fillRatio = CGFloat(safeLiquid) / 10      // maxvärde 8 motsvarar full höjd
                    let topGap: CGFloat = 15                      // hur långt från toppen vätskan ska stanna

//                    VStack{
//                        Spacer()
//                            .frame(height: fullHeight * (1 - fillRatio) + topGap)
//                        
//                        ZStack{
//                            VStack{
////                                Spacer()
//                                Rectangle()
//                                    .fill(Color(hex: "3a9ff2"))
//                                    .clipShape(RoundedCorners(radius: 22, corners: [.bottomLeft, .bottomRight]))
//                                    .frame(width: 28, height: fullHeight * fillRatio - 10)
//                                    .padding(.bottom, 4)
////                                Spacer()
//                            }
//                            .frame(alignment: .bottom)
//                        
//                            
//                            VStack{
//                                Ellipse()
//                                    .fill(Color(hex: "3a9ff2"))
//                                    .frame(width: 28, height: 12)
//                                    .overlay(
//                                        Ellipse()
//                                            .stroke(Color(hex:"c7c7c7"), lineWidth: 4)
//                                    )
//                                    .offset(y: -6)
//                                Spacer()
//                            }
//                            .frame(maxWidth: .infinity)
//                        }
//                        
//                        
//                        
//                    }
                    
                    VStack {
                        Spacer()

                        ZStack(alignment: .bottom) {
                            
                            let liquidHeight = max(0, fullHeight * fillRatio - topGap)

                            // Vätskan
                            Rectangle()
                                .fill(Color(hex: "3a9ff2"))
                                .clipShape(RoundedCorners(radius: 22, corners: [.bottomLeft, .bottomRight]))
                                .frame(width: 28, height: liquidHeight)
                                .padding(.bottom, 6)

                            // Toppen (ellipsen)
                            Ellipse()
                                .fill(Color(hex: "3a9ff2"))
                                .frame(width: 28, height: 12)
                                .overlay(
                                    Ellipse()
                                        .stroke(Color(hex:"c7c7c7"), lineWidth: 4)
                                )
                                .offset(y: -liquidHeight)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
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
    }
}

#Preview {
    LiquidView()
}
