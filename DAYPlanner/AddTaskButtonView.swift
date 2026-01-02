//
//  AddTaskButtonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-02.
//

import SwiftUI

struct AddTaskButtonView: View {
    @State private var blurGridLayer: Bool = false
    
    var body: some View {
        

            
            HStack{
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(.blue)
                        .opacity(0.7)
                        .cornerRadius(10)
                        .frame(width: 35, height: 35)
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
                Spacer()
            }




    }
}

#Preview {
    AddTaskButtonView()
}
