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
                Text("\(week): \(weekTasks[weekTask])")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 10))
            
                if (weekTasks.count > 1) {
                    Text("...")
                        .foregroundStyle(Color.gray)
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
