//
//  LiquidView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-23.
//

import SwiftUI

struct LiquidView: View {
    var body: some View {
        
        
                    ZStack{
                        
                        VStack{
                            Spacer()
                            Rectangle()
                                .fill(Color(hex:"c7c7c7"))
                                .clipShape(RoundedCorners(radius: 12, corners: [.bottomLeft, .bottomRight])) .clipShape(RoundedCorners(radius: 2, corners: [.topLeft, .topRight]))
                                .frame(width: 40, height: .infinity)
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 35, height: 0)
                        }
                        
                        VStack{
                            Spacer()
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 28, height: 100)
                                .clipShape(RoundedCorners(radius: 8, corners: [.bottomLeft, .bottomRight]))
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 35, height: 6)
                        }
                        
                        }
                
        }
    }

#Preview {
    LiquidView()
}
