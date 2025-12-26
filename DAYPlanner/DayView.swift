//
//  MonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let dayTasks = ["skola", "jobba", "träna", "bygga", "koda", "vila", "jobba"]

struct DayView: View {
    var body: some View {
            HStack(spacing: 2){
                ForEach (0..<min(5, dayTasks.count), id: \.self) { monTask in
                    Text("•")
                        .padding(2)
                        .foregroundStyle(Color.gray)
                        .cornerRadius(20)
                        .border(Color.red, width: 1)
                }
            }
            .padding(2)
            .border(Color.gray, width: 1)
        
        }
}
#Preview {
    DayView()
}
