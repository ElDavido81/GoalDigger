//
//  DAYPlannerApp.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

@main
struct DAYPlannerApp: App {
    
    @StateObject private var callManager = CallManager()
    @StateObject private var taskManager = TaskManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
            
                .environmentObject(callManager)
                .environmentObject(taskManager)
        }
    }
}
