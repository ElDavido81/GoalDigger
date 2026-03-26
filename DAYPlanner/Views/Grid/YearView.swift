//
//  YearView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

struct YearView: View {
    
    @ObservedObject var tm: TaskManager
    
    let yearNumber: Int
    let currentYear = Calendar.current.component(.year, from: Date())
    
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    private var whatYear: Date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: Date())
        return calendar.date(from: components) ?? Date()
        }
    
    var body: some View {
        VStack(spacing: 2){
            
            
            ForEach (tm.incompleteTasks
                .filter { task in
                 guard let goalDate = formatter.date(from: task.goalDate) else {return false}
                 let calendar = Calendar.current
                 let taskYear = calendar.component(.year, from: goalDate)
                 return taskYear == yearNumber
             }
                        .sorted { $0.createdAt > $1.createdAt }
                        .prefix(3),
                     
                     id: \.id) { task in
                
                TaskView(task: task)

            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }


//#Preview {
//    YearView(tm: TaskManager())
//}
