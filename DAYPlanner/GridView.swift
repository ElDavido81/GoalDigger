//
//  GridView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-29.
//

import SwiftUI


let months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
]

let weekdays = [
    "M", "T", "W", "TH", "F", "S", "SU"
]

let nextweeks: [String] = [
    "1W", "2W", "3W"
]

struct GridView: View {
    
    @State private var fullView = false
    
    func showWeekdays() -> some View {
        ForEach(weekdays, id: \.self) { index in
            HStack(spacing: 0) {
                Text(index)
                    .foregroundStyle(.black)
                    .font(.system(size: 10))
                    .frame(maxHeight: .infinity) // ← gör raden flexibel
                DayView(weekday: index)
                    .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .border(Color.red, width: 1)
            
            
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
        ForEach(nextweeks, id: \.self) { week in
            HStack(spacing: 0) {
                Text(week)
                    .foregroundStyle(.black)
                    .font(.system(size: 10))
                    .frame(maxHeight: .infinity)
                WeekView(week: week)
                    .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .border(Color.red, width: 1)
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
    
    func showQuarters() -> some View {
        ForEach (0..<(months.count / 4), id: \.self) { month in
            VStack{
                Text((months[month]))
                MonthView()
            }
            .padding(8)
            .border(Color.red, width: 1)
        }
    }
    
    func showYears() -> some View {
        ForEach (9..<(months.count), id: \.self) { month in
            VStack{
                Text((months[month]))
                MonthView()
            }
            .padding(8)
            .border(Color.red, width: 1)
        }
    }
    
    
    var body: some View {
        HStack(spacing: 0) {

            // DAYS + WEEKS
            VStack(spacing: 0) {
                showWeekdays()
                showNextWeeks()
            }
            .frame(width: 120)


            // HÖGER DEL
            VStack(spacing: 0) {

                // MONTHS (2 rader × 6 kolumner) ----- IMPROVE!!
                    HStack(spacing: 0) {
                        showFirstMonths()
                    }
                HStack(spacing: 0){
                    showSecondMonths()
                }

                // 3-6 MONTHS + YEAR (1 rad × 3 kolumner)
                HStack(spacing: 0) {
                    showQuarters()

                }

                // 1 - 3 YEARS (1 rad × 3 kolumner)
                HStack(spacing: 0) {
                    showYears()

                }
            }
        }
        .padding()
    }
}


#Preview {
    GridView()
}
