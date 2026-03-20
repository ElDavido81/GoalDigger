//
//  TaskView.swift
//  DayByDay
//
//  Created by David Kalitzki on 2025-05-06.
//

import SwiftUI


struct TaskView: View {
    
    @ObservedObject var task: Task
    
    var body: some View {
        
        Text(task.taskTitle)
            .foregroundStyle(Color.white.opacity(0.9))
            .font(.system(size: 10))
//        Text(String(task.taskValue))
        
    }
    
//    #Preview {
//        TaskView(task)
//    }
}
