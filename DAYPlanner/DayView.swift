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
            VStack{
                ForEach (0..<min(3, dayTasks.count), id: \.self) { dayTask in
                    HStack{ // bara för att se kopplingen, ta bort sen
                    Text("\(weekday) \(dayTasks[dayTask])")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 10))
//                    if (dayTask == min(3, dayTasks.count) - 1 && dayTasks.count > 3) {
//                        Text("...")
//                            .foregroundStyle(Color.gray)
//                            .font(.system(size: 10))
//                    }
                    }
                }

            }
        }
}
#Preview {
    DayView(weekday: "")
}
