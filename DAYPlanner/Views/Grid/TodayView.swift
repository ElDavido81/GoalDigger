//
//  DaysView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let todayTasks = ["skola", "jobba", "träna", "bygga", "koda", "vila", "jobba"]

struct TodayView: View {
    var body: some View {
            VStack(spacing: 2){
                ForEach (todayTasks, id: \.self) { task in
                    Text("\(task)")
//                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(2)
                        .foregroundStyle(Color.gray)
                        .cornerRadius(20)
                        .border(Color.red, width: 1)
                }
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)
            .border(Color.gray, width: 1)
        }
}
#Preview {
    TodayView()
}
