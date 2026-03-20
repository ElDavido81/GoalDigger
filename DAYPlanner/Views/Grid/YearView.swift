//
//  YearView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

struct YearView: View {
    
    @ObservedObject var tm: TaskManager
    
    var body: some View {
        VStack(spacing: 2){
            
            let currentYear = Calendar.current.component(.year, from: Date())
            let threeYear = currentYear + 2
            
            ForEach (tm.incompleteTasks
                .filter { task in
                            guard task.goalDate.count >= 4 else { return false }
                            return Int(task.goalDate.prefix(4)) == threeYear
                        }
                        .sorted { $0.createdAt > $1.createdAt }
                        .prefix(3),
                     
                     id: \.taskTitle) { task in
                
                TaskView(task: task)

//                Text("\(task)")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .foregroundStyle(Color.white.opacity(0.9))
//                    .font(.system(size: 10))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear{
//            callManager.getTasksById{
//                incompleteTasks = callManager.getIncompleteTasks()
            }
        }
    }


#Preview {
    YearView(tm: TaskManager())
}
