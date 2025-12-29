//
//  YearView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let yearTasks = [
    "månen", "hus", "ledig", "hund"
]


struct YearView: View {
    var body: some View {
        VStack(spacing: 2){
            ForEach (yearTasks.prefix(3), id: \.self) { task in
                Text("\(task)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.white.opacity(0.9))
                    .font(.system(size: 10))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    YearView()
}
