//
//  MonthView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let tasks = [
    "måla", "flytta", "bilen", "båten"
]


struct MonthView: View {
    var body: some View {
        VStack(spacing: 2){
            ForEach (tasks, id: \.self) { task in
                Text("\(task)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.white.opacity(0.9))
                    .font(.system(size: 10))
//                    .border(Color.red, width: 1)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MonthView()
}
