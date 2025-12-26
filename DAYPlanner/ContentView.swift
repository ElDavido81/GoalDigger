//
//  ContentView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

let months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
]
let weekdays = [
    "M", "T", "W", "T", "F", "S", "S"
]

struct ContentView: View {
    var body: some View {
        HStack{
            VStack(spacing: 8){
                ForEach (weekdays, id: \.self) {weekday in
                    HStack{
                        Text(weekday)
                        DayView()
                    }
                }
                OneWeekView()
                TwoWeekView()
                ThreeWeekView()
            }

            VStack{
                HStack{
                    ForEach (0..<(months.count / 2), id: \.self) { month in
                        VStack{
                            Text((months[month]))
                            MonthView()
                        }
                        .padding(8)
                        .border(Color.red, width: 1)
                    }
                }
                HStack{
                    ForEach (6..<(months.count), id: \.self) { month in
                        VStack{
                            Text((months[month]))
                            MonthView()
                        }
                        .padding(8)
                        .border(Color.red, width: 1)
                    }
                }
            }
            
                }
        }
    }
#Preview {
ContentView()
}
