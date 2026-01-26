//
//  AddTaskButtonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-02.
//

import SwiftUI

struct AddTaskButtonView: View {
    @Binding var blurGridLayer: Bool
    
    var body: some View {
            
                ZStack{
                    Rectangle()
                        .fill(Color(hex: "3a9ff2"))
                        .opacity(0.7)
                        .cornerRadius(10)
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            blurGridLayer.toggle()
                        }
                    
                    Text("+")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 40 ))
                        .baselineOffset(4)
                        }
            }
}

#Preview {
    AddTaskButtonView(blurGridLayer: .constant(false))
}
