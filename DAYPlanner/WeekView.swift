//
//  WeekView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let weekTasks = ["workout", "holiday", "project", "bygga", "koda", "vila", "jobba"]


struct WeekView: View {
    
    var week: String
    
    var body: some View {
        HStack(spacing: 2){
            ForEach (0..<min(1, weekTasks.count), id: \.self) { weekTask in
//                Text("\(week):")
//                    .foregroundStyle(Color.gray)
//                    .font(.system(size: 10))
                Text("\(weekTasks[weekTask])")
                    .foregroundStyle(Color.white.opacity(0.9))
                    .font(.system(size: 10))
                if (weekTasks.count > 1) {
                    Text("...")
                        .foregroundStyle(Color.white.opacity(0.9))
                        .font(.system(size: 10))
                }
            }
        
        }
        .padding(2)
    }
}

#Preview {
    WeekView(week: "")
}
