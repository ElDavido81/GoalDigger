//
//  MonView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI


struct DayView: View {
    
    @ObservedObject var tm: TaskManager
    
    var body: some View {
        HStack(spacing: 0){
            
            let today: String = {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                return formatter.string(from: Date())
            }()
            
            ForEach(tm.incompleteTasks
                .filter { $0.goalDate == today }
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(1), id: \.id) { task in
                
                TaskView(task: task)
                
            }
            
        }
        .frame(alignment: .leading)
        .padding(2)
        }
        
        //#Preview {
        //    DayView(weekday: "")
        //}
    }

