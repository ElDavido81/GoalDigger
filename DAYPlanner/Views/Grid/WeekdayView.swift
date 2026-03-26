//
//  MonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

struct WeekdayView: View {
    
    @ObservedObject var tm: TaskManager
    let selectedDate: Date
    
    private let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()

    var body: some View {
        VStack(spacing: 5) {
            
            
            ForEach(
                tm.incompleteTasks
                    .filter { task in
                        guard let goalDate = formatter.date(from: task.goalDate) else { return false }
                        return Calendar.current.isDate(goalDate, inSameDayAs: selectedDate) 
                    }
                    .sorted { $0.createdAt > $1.createdAt },
                id: \.id
            ) { task in
                TaskRowView(tm: tm, task: task)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(2)
    }
}
