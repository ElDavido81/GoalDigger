//
//  GridView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-29.
//

import SwiftUI


let months = [
    "jan", "feb", "mar", "apr", "may", "jun",
    "jul", "aug", "sep", "oct", "nov", "dec"
]

let weekdays = [
    "M", "T", "W", "T", "F", "S", "S"
]

let nextweeks: [String] = [
    "1W", "2W", "3W"
]

let quarters: [String] = [
    "1 MONTH", " 3 MONTHS", "6 MONTHS"
]

struct GridView: View {
    
    @State private var fullView = false
    
    func showWeekdays() -> some View {
        ForEach(weekdays, id: \.self) { index in
            HStack(spacing: 0) {

                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                
                Text(index)
                    .foregroundStyle(.black)
                    .font(.system(size: 10))
                DayView(weekday: index)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.2)) // Lägg till bakgrundsfärg här
            .cornerRadius(5) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
            
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
                
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                
                Text(week)
                    .foregroundStyle(.black)
                    .font(.system(size: 10))
                WeekView(week: week)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
//            .border(Color.white, width: 3)
            .background(Color.green.opacity(0.2)) // Lägg till bakgrundsfärg här
            .cornerRadius(10) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
        }
    }
    
    func showFirstMonths() -> some View {
        ForEach (0..<(months.count / 2), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .font(.system(size: 10))
                MonthView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
//            .border(Color.white, width: 3)
            .background(Color.yellow.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(15) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
        }
    }
    
    func showSecondMonths() -> some View {
        ForEach (6..<(months.count), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .font(.system(size: 10))
                MonthView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
//            .border(Color.white, width: 3)
            .background(Color.yellow.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(15) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
        }
    }
    
    func showQuarters() -> some View {
        ForEach (0..<(quarters.count), id: \.self) { index in
            VStack{
                Text((quarters[index]))
                    .font(.system(size: 10))
                QuarterView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
            .background(Color.pink.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(20) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
        }
    }
    
    func showYears() -> some View {
        ForEach (9..<(months.count), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .font(.system(size: 10))
                MonthView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 12)
            .padding(.top, 8)
            .background(Color.purple.opacity(0.2)) // Lägg till bakgrundsfärg här
            .cornerRadius(30) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 3) // Ramen med rundade hörn
                )
        }
    }
    
    
    var body: some View {
        HStack(spacing: 0) {

            // DAYS + WEEKS
            VStack(spacing: 0) {
                showWeekdays()
                showNextWeeks()
            }
            .frame(width: 150)


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
