//
//  ContentView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fullView = false

    let months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ]

    let weekdays = [
        "M", "T", "W", "TH", "F", "S", "SU"
    ]

    let nextweeks: [String] = [
        "NW", "2W", "3W"
    ]
    

    func showWeekdays() -> some View {
        ForEach (weekdays, id: \.self) {index in
            HStack{
                Text(index)
                    .foregroundStyle(Color.black)
                    .font(.system(size: 10))
                    .padding(10)
                DayView(weekday: index)
            }
            .border(Color.red, width: 1)
            .padding(1)
            
            .onTapGesture {
                switch index {
                case weekdays[0]:
                    print("monday trycktes")
                    fullView.toggle()
                    print(fullView)
                case weekdays[1]:
                    print("tues trycktes")
                case weekdays[2]:
                    print("wed trycktes")
                case weekdays[3]:
                    print("thur trycktes")
                case weekdays[4]:
                    print("fri trycktes")
                case weekdays[5]:
                    print("sat trycktes")
                case weekdays[6]:
                    print("sun trycktes")
                default:
                    break
                }
                }
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
    
    var body: some View {
        ZStack{
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
            if !fullView {
                Text("hej")
                    .font(.system(size: 30))
            }
        }
    }
}
    
#Preview {
ContentView()
}
