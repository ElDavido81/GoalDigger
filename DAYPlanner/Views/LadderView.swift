//
//  LadderView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-22.
//

import SwiftUI

struct LadderView: View {
    var body: some View {

        
        VStack{
            Rectangle()
                .foregroundStyle(Color.gray)
                .frame(width: 40, height: 200)
            
            Spacer(minLength:8)
            
            ZStack{
                HStack(spacing: 25) {
                    Rectangle()
                        .foregroundStyle(Color(hex: "C2905B"))
                        .frame(width: 5, height: .infinity)
                        .cornerRadius(10)
                        .shadow(radius: 8)
                    Rectangle()
                        .foregroundStyle(Color.init(hex: "C2905B"))
                        .frame(width: 5, height: .infinity)
                        .cornerRadius(10)
                        .shadow(radius: 8)
                }
                
                VStack {
                    Spacer(minLength: 5)
                    ForEach (1...6, id: \.self) {i in
                        Rectangle()
                            .foregroundStyle(Color(hex: "C2905B"))
                            .frame(width: 40, height: 5)
                            .cornerRadius(10)
                        Spacer(minLength: 5)
                    }
                    
                }
                
                VStack{
                    Spacer()
                    Rectangle()
                        .frame(width: 40, height: 60)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "1c1c1c"), .clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            ))
                }
                
            }
            .frame(maxHeight: .infinity)
            

            
        }
        

        

    
    }
}

#Preview {
    LadderView()
}
