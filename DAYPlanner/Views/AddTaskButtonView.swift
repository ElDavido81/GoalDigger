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
            
//            HStack{
//            VStack{
//                Spacer()
                ZStack{
                    Rectangle()
                        .fill(.blue)
                        .opacity(0.7)
                        .cornerRadius(10)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            blurGridLayer.toggle()
                        }
                    
                    Text("+")
                        .foregroundStyle(Color.white)
                        .opacity(0.8)
                        .fontWeight(.heavy)
                        .font(.system(size: 20 ))
                        .baselineOffset(4)
                        }
            }
//                Spacer()
//            }
//    }
}

#Preview {
    AddTaskButtonView(blurGridLayer: .constant(false))
}
