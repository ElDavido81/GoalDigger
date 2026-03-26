//
//  AddTaskButtonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-02.
//

import SwiftUI

struct AddTaskButtonView: View {
    @State private var navigateStatus = false

    
    var body: some View {
        
        NavigationStack {
            
            Button(action: {
                navigateStatus = true
            })
            {
                ZStack{
                    Rectangle()
                        .fill(Color(hex: "3a9ff2"))
                        .opacity(0.7)
                        .cornerRadius(10)
                        .frame(width: 50, height: 50)
                    Text("+")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 40 ))
                        .baselineOffset(4)
                }
            }
        }
        .navigationDestination(isPresented: $navigateStatus) {
            AddTaskView()
//            .navigationBarHidden(true)
        }
            }
}

#Preview {
    AddTaskButtonView()
}
