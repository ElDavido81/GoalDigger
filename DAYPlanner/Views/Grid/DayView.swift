//
//  MonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI


struct DayView: View {
    
    @ObservedObject var tm: TaskManager
    let taskAmount: Int
    let weekday: Int
    
    private var todayDate: Date {
        return Date()
    }
    
    private let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    private var dayDate: Date {
        let calendar = Calendar.current
        let today = Date()
        
        // Hitta start av veckan (måndag)
        guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)) else {
            return today
        }
        
        // Lägg till weekday offset (weekday - 1)
        return calendar.date(byAdding: .day, value: weekday - 1, to: startOfWeek) ?? today
    }
    
    var body: some View {
        VStack(spacing: 0){            
            ForEach(tm.incompleteTasks
                .filter
                { task in
                guard let goalDate = formatter.date(from: task.goalDate) else { return false }
                return Calendar.current.isDate(goalDate, inSameDayAs: dayDate)
                }
                
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(taskAmount), id: \.id) { task in
                
                    TaskView(task: task)
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(2)
        .onAppear {
            print("Today:", formatter.string(from: todayDate))
            tm.incompleteTasks.forEach { print($0.goalDate) }
        print(weekday)
        }
        }
        
        //#Preview {
        //    DayView(weekday: "")
        //}
    }

