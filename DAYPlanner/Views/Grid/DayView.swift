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
            
            let todayString: String = {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"  // Anpassa formatet om ditt goalDate är annorlunda
                return formatter.string(from: Date())
            }()
            
            ForEach(tm.incompleteTasks
                .filter { $0.goalDate == todayString } // Filtrera bara dagens uppgifter
                .sorted { $0.createdAt > $1.createdAt }
                .prefix(1), id: \.id) { task in
                
                TaskView(task: task)
                
            }
                .overlay(
                    // Visa ProgressView om listan är tom
                    Group {
                        if tm.incompleteTasks.isEmpty {
                            ProgressView()
                                .scaleEffect(1.5)
                        }
                    }
                )
            
        }
        .frame(alignment: .leading)
        .padding(2)
        .onAppear{
//            callManager.getTasksById{
//                let listOfTasks = callManager.getIncompleteTasks()
//                DispatchQueue.main.async {
//                    incompleteTasks = listOfTasks
//                    }
//                }
            
            
            
            }
        }
        
        //#Preview {
        //    DayView(weekday: "")
        //}
    }

