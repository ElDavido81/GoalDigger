//
//  MonthView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

struct MonthView: View {
    
    @ObservedObject var tm: TaskManager
    let monthNumber: Int
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    private var whatMonth: Date {
            let calendar = Calendar.current
            var components = calendar.dateComponents([.year], from: Date())
            components.month = monthNumber   // 1 = januari, 2 = februari
            components.day = 1
            return calendar.date(from: components) ?? Date()
        }

    var body: some View {
        VStack(spacing: 2){
            
            ForEach(tm.incompleteTasks
                .filter
                    { task in
                guard let goalDate = formatter.date(from: task.goalDate) else {return false}
                let calendar = Calendar.current
                return calendar.component(.year, from: goalDate) == calendar.component(.year, from: whatMonth) &&
                       calendar.component(.month, from: goalDate) == calendar.component(.month, from: whatMonth)
                
            }
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(1), id: \.id) { task in
                TaskView(task: task)
                
            }
            }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            print("monthNumber: \(monthNumber)")
        }
        }


    }
