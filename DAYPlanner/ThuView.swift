//
//  ThuView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let thuTasks = ["skola", "jobba", "träna", "bygga", "koda", "vila", "jobba"]

struct ThuView: View {
    var body: some View {
            HStack(spacing: 2){
                ForEach (0..<min(5, thuTasks.count), id: \.self) { monTask in
                    Text("•")
                        .padding(2)
                        .foregroundStyle(Color.gray)
                        .cornerRadius(20)
                        .border(Color.red, width: 1)
                }
            }
            .padding(5)
            .border(Color.gray, width: 1)
        
        }
}

#Preview {
    ThuView()
}
