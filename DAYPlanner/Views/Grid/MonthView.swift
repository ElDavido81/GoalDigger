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

    var body: some View {
        VStack(spacing: 2){
                            
            let whatMonth: String = {
                let calendar = Calendar.current
                let today = Date()
                
                guard let monthDate = calendar.date(byAdding: .month, value: monthNumber, to: today) else { return "" }
                print("Medskickad månad: \(monthNumber)")
                print("Uträknad månad: \(monthDate)")
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                
                let formattedDate = formatter.string(from: monthDate)
                
                print("Månad som jämförs: \(formattedDate)")
                
                return formattedDate
                
            }()
            
            ForEach(tm.incompleteTasks
                .filter { $0.goalDate == whatMonth }
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(1), id: \.id) { task in
                TaskView(task: task)
                
            }
                
                
//                Text("\(task)")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .foregroundStyle(Color.white.opacity(0.9))
//                    .font(.system(size: 10))
            }
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }


//#Preview {
//    MonthView()
//}



//
//let nextMonthAdjusted: String = {
//    let calendar = Calendar.current
//    let today = Date()
//    
//    // Hämta komponenter för dag, månad och år
//    var components = calendar.dateComponents([.year, .month, .day], from: today)
//    
//    // Lägg till 1 månad
//    components.month! += 1
//    
//    // Om det resulterande datumet inte finns (t.ex. 31 feb), justera automatiskt
//    let nextMonthDate = calendar.date(from: components) ?? calendar.date(byAdding: .month, value: 1, to: today)!
//    
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    return formatter.string(from: nextMonthDate)
//}()
