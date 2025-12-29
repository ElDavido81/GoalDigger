//
//  QuarterView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let quarterTasks = [
    "spanska", "milen", "bilen", "hund"
]


struct QuarterView: View {
    var body: some View {
        VStack(spacing: 2){
            ForEach (quarterTasks.prefix(3), id: \.self) { task in
                Text("\(task)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 10))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    QuarterView()
}
