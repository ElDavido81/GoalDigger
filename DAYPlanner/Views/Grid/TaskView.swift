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
        let screen = UIScreen.main.bounds
                let isLandscape = screen.width > screen.height
                let fontSize: CGFloat = isLandscape ? 10 : 24

            
            Text(task.taskTitle)
                .foregroundStyle(Color.white.opacity(0.9))
                .font(.system(size: fontSize))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        
        //    #Preview {
        //        TaskView(task)
        //    }
    }

