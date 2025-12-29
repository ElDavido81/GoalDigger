//
//  MonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let dayTasks = ["skola", "jobba", "träna", "bygga", "koda", "vila", "jobba"]

struct DayView: View {
    
    var weekday: String
    
    var body: some View {
        HStack(spacing: 0){
                ForEach (0..<min(1, dayTasks.count), id: \.self) { dayTask in
                    //                Text("\(dayTask):")
                    //                    .foregroundStyle(Color.gray)
                    //                    .font(.system(size: 10))
                                    Text("\(dayTasks[dayTask])")
                        .foregroundStyle(Color.white.opacity(0.9))
                        .font(.system(size: 10))
                    if (dayTask == min(1, dayTasks.count) - 1 && dayTasks.count > 3) {
                        Text("...")
                            .foregroundStyle(Color.white.opacity(0.9))
                            .font(.system(size: 10))
                    }
                    
                }

            }
            .frame(alignment: .leading)
            .padding(2)
        }
}
#Preview {
    DayView(weekday: "")
}
