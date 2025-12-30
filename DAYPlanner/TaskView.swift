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
        
        Text(task.title)
//        Text(String(task.taskValue))
        
    }
    
//    #Preview {
//        TaskView(task)
//    }
}
