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

let nextweeks: [String] = [
    "NW", "2W", "3W"
]

func showWeekdays() -> some View {
    ForEach (weekdays, id: \.self) {weekday in
        HStack{
            Text(weekday)
                .foregroundStyle(Color.black)
                .font(.system(size: 10))
                .padding(10)
            DayView(weekday: weekday)
        }
        .border(Color.red, width: 1)
        .padding(1)

    }
}

func showNextWeeks() -> some View {
    ForEach (nextweeks, id: \.self) {week in
        HStack{
            Text(week)
                .foregroundStyle(Color.black)
                .font(.system(size: 10))
            WeekView(week: week)
        }
    }
}

func showFirstMonths() -> some View {
    ForEach (0..<(months.count / 2), id: \.self) { month in
        VStack{
            Text((months[month]))
            MonthView()
        }
        .padding(8)
        .border(Color.red, width: 1)
    }
}

func showSecondMonths() -> some View {
    ForEach (6..<(months.count), id: \.self) { month in
        VStack{
            Text((months[month]))
            MonthView()
        }
        .padding(8)
        .border(Color.red, width: 1)
    }
}



struct ContentView: View {
    var body: some View {
        HStack{
            VStack{
                showWeekdays()
                showNextWeeks()
                Spacer()
            }
            
            
            VStack{
                HStack{
                    showFirstMonths()
                }
                HStack{
                    showSecondMonths()
                }
                HStack{
                    Text("1 month")
                    Text("3 months")
                    Text("6 months")
                }
                HStack{
                    Text("1 year")
                    Text("2 years")
                    Text("3 years")
                }
                Spacer()
            }
         Spacer()
        }
        .padding()
    }
}
    
#Preview {
ContentView()
}
