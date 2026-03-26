////
////  WeekView.swift
////  DAYPlanner
////
////  Created by David Kalitzki on 2025-12-26.
////
//
//import SwiftUI
//
//let weekTasks = [""]
//
//
//struct WeekView: View {
//    
//    var week: String
//    
//    var body: some View {
//        HStack(spacing: 2){
//            ForEach (0..<min(1, weekTasks.count), id: \.self) { weekTask in
////                Text("\(week):")
////                    .foregroundStyle(Color.gray)
////                    .font(.system(size: 10))
//                Text("\(weekTasks[weekTask])")
//                    .foregroundStyle(Color.white.opacity(0.9))
//                    .font(.system(size: 10))
//                if (weekTasks.count > 1) {
//                    Text("...")
//                        .foregroundStyle(Color.white.opacity(0.9))
//                        .font(.system(size: 10))
//                }
//            }
//        
//        }
//        .padding(2)
//    }
//}
//
//#Preview {
//    WeekView(week: "")
//}


import SwiftUI

struct WeekView: View {
    
    @ObservedObject var tm: TaskManager
    let weekNumber: Int
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    private var startOfWeek: Date {
        let calendar = Calendar.current
        let now = Date()
        let currentWeek = calendar.component(.weekOfYear, from: now)
        var components = calendar.dateComponents([.yearForWeekOfYear], from: now)
        components.weekOfYear = weekNumber
        components.weekday = calendar.firstWeekday // starta veckan från måndag/söndag
        return calendar.date(from: components) ?? now
    }
    
    var body: some View {
        VStack(spacing: 2) {
            
            ForEach(tm.incompleteTasks
                .filter { task in
                    guard let goalDate = formatter.date(from: task.goalDate) else { return false }
                    let calendar = Calendar.current
                    let taskWeek = calendar.component(.weekOfYear, from: goalDate)
                    let taskYear = calendar.component(.yearForWeekOfYear, from: goalDate)
                    let startYear = calendar.component(.yearForWeekOfYear, from: startOfWeek)
                    return taskWeek == weekNumber && taskYear == startYear
                }
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(1), id: \.id) { task in
                    TaskView(task: task)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            print("weekNumber: \(weekNumber)")
        }
    }
}
