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
    "M ", "T ", "W", "T ", "F ", "S ", "S "
]

let nextweeks: [String] = [
    "1W", "2W", "3W"
]

let quarters: [String] = [
    "1 month", "3 months", "6 months"
]

let currentYear = Calendar.current.component(.year, from: Date())
let years: [Int] = (0...2).map {
    currentYear + $0
}


struct GridView: View {
    
    @State private var fullView = false
    
    @EnvironmentObject var tm: TaskManager
    @EnvironmentObject var callManager: CallManager
    
    @State private var selectedDate: Date? = nil
    @State private var showWeekdaySheet = false
    
    
    func showWeekdays() -> some View {
        ForEach(weekdays.indices, id: \.self) { index in
            HStack(spacing: 0) {

                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                
                Text(weekdays[index])
                    .foregroundStyle(.black.opacity(0.3))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                DayView(tm: tm, taskAmount: 1, weekday: index + 1)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .background(Color(hex:"3a9ff2"))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 0)
                )
            
            .onTapGesture {
                let calendar = Calendar.current
                                let today = Date()
                                let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start ?? today
                                selectedDate = calendar.date(byAdding: .day, value: index, to: startOfWeek) ?? today
                                showWeekdaySheet = true
            }
            }
        }
    
//    func showNextWeeks() -> some View {
//        ForEach(nextweeks, id: \.self) { week in
//            HStack(spacing: 0) {
//                
//                Rectangle()
//                    .frame(width: 5)
//                    .opacity(0)
//                
//                Text(week)                    .foregroundStyle(.white.opacity(0.4))
//                    .font(.system(size: 14))
//                    .fontWeight(.heavy)
//                Rectangle()
//                    .frame(width: 5)
//                    .opacity(0)
//                WeekView(week: week)
//                Spacer()
//            }
//            .frame(maxHeight: .infinity)
//            .frame(maxWidth: .infinity)
//            .background(Color.green.opacity(0.15))
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.white, lineWidth: 0)
//                )
//        }
//    }

    func showNextWeeks() -> some View {
        let calendar = Calendar.current
        let currentWeek = calendar.component(.weekOfYear, from: Date())
        
        return VStack { // <-- måste returnera en View
            ForEach(0..<nextweeks.count, id: \.self) { week in
                    HStack(spacing: 0) {
                        Rectangle()
                            .frame(width: 5)
                            .opacity(0)
                    Text(nextweeks[week])
                        .foregroundStyle(.white.opacity(0.4))
                        .font(.system(size: 14))
                        .fontWeight(.heavy)
                        Rectangle()
                            .frame(width: 5)
                            .opacity(0)
                    WeekView(tm: tm, weekNumber: currentWeek + week + 1)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(8)
                .background(Color.green.opacity(0.15))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 0)
                )
            }
        }
    }
    
    func showFirstMonths() -> some View {
        
        ForEach (0..<(months.count / 2), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                    MonthView(tm: tm, monthNumber: month + 1)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
            .background(Color.purple.opacity(0.15))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 0)
                )
        }
    }
    
    func showSecondMonths() -> some View {
        
        ForEach (6..<(months.count), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                MonthView(tm: tm, monthNumber: month)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
            .background(Color.purple.opacity(0.15))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 0)
                )
        }
    }
    
//    func showQuarters() -> some View {
//        ForEach (0..<(quarters.count), id: \.self) { index in
//            VStack{
//                Text((quarters[index]))
//                    .foregroundStyle(.white.opacity(0.4))
//                    .font(.system(size: 14))
//                    .fontWeight(.heavy)
//                QuarterView()
//            }
//            .frame(maxHeight: .infinity, alignment: .top)
//            .padding(.leading, 12)
//            .padding(.top, 8)
//            .padding(.bottom, 8)            .background(Color.pink.opacity(0.15))
//            .cornerRadius(20)
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.white, lineWidth: 0)
//                )
//        }
//    }
    
    func showQuarters() -> some View {
        
        ForEach(0..<quarters.count, id: \.self) { index in
            VStack {
                
                Text(quarters[index])
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                
                QuarterView(tm: tm, quarterIndex: index) // logik ligger i QuarterView
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
            .background(Color.pink.opacity(0.15))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 0)
            )
        }
    }
    
    func showYears() -> some View {
        ForEach (years, id: \.self) { year in
            VStack{
                Text(String(year))
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white.opacity(0.4))
                    .shadow(radius: 8)
                YearView(tm: tm, yearNumber: year)
            }
            .onTapGesture {
                // Visa allt på detta år → använd 1 jan som "startdatum"
                let calendar = Calendar.current
                if let yearStart = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) {
                    selectedDate = yearStart
                    showWeekdaySheet = true
                }
            }
            
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 15)
            .padding(.top, 5)
            .padding(.bottom, 8)
            .background(Color.orange.opacity(0.15))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 0)
                )

        }
    }
    
    var body: some View {
        
        
        HStack{
            EdgeView()
                .frame(width: 60)

        HStack(spacing: 4) {            
            VStack(spacing: 4) {
                showWeekdays()
                showNextWeeks()
            }
            .frame(width: 150)
            
            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    showFirstMonths()
                }
                HStack(spacing: 4){
                    showSecondMonths()
                }
                HStack(spacing: 4) {
                    showQuarters()
                }
                HStack(spacing: 4) {
                    showYears()
                }
            }
        }
            

    }
        .padding()
        .background(Color.black.opacity(0.9))
        .task{
            callManager.getTasksById{
                tm.incompleteTasks = callManager.getIncompleteTasks()
            }
        }
        .sheet(isPresented: $showWeekdaySheet) {
            if let date = selectedDate {
                WeekdayView(tm: tm, selectedDate: date)
            }
        }
    }

}



//#Preview {
//    GridView(tm: TaskManager() )
//}
