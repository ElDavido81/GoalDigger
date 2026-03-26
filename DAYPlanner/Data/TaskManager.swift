//
//  TaskManager.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-17.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var incompleteTasks: [Task] = []
    @Published var lazyLiquid: Int = 2

}
