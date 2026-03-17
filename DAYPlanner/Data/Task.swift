//
//  Task.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-30.
//

import SwiftUI

class Task : ObservableObject, Identifiable {
//    
//    var id : Int
//    var title : String
//    var createdAt: String
//    var doneDate: String
//    var taskValue: Int
//    var content : String
//    @Published var complete : Bool

    var id : String
    var taskTitle : String
    var createdAt: String
    var goalDate: String
    var taskValue: Int
    var taskText : String
    @Published var taskStatus : Bool
    
//    init(id: Int, title: String, createdAt: String, doneDate: String, taskValue: Int, content: String, complete: Bool) {
//        self.id = id
//        self.title = title
//        self.createdAt = createdAt
//        self.doneDate = doneDate
//        self.taskValue = taskValue
//        self.content = content
//        self.complete = complete
//    }

    init(id: String, taskTitle: String, createdAt: String, goalDate: String, taskValue: Int, taskText: String, taskStatus: Bool) {
        self.id = id
        self.taskTitle = taskTitle
        self.createdAt = createdAt
        self.goalDate = goalDate
        self.taskValue = taskValue
        self.taskText = taskText
        self.taskStatus = taskStatus
    }

}
