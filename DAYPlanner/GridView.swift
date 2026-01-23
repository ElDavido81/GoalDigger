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
    "mon", "tue", "wed", "thu", "fri", "sat", "sun"
]

let nextweeks: [String] = [
    "1W", "2W", "3W"
]

let quarters: [String] = [
    "1 month", "3 months", "6 months"
]

let years: [String] = [
    "2026", "2027", "2028"
]


struct GridView: View {
    
    @Binding var blurGridLayer: Bool
    @State private var fullView = false
    
    func showWeekdays() -> some View {
        ForEach(weekdays, id: \.self) { index in
            HStack(spacing: 0) {

                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                
                Text(index)
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                DayView(taskData: TaskData())
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.2)) // Lägg till bakgrundsfärg här
            .cornerRadius(5) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
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
                
                Text(week)                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                Rectangle()
                    .frame(width: 5)
                    .opacity(0)
                WeekView(week: week)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
//            .border(Color.white, width: 3)
            .background(Color.green.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(10) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
                )
        }
    }
    
    func showFirstMonths() -> some View {
        ForEach (0..<(months.count / 2), id: \.self) { month in
            VStack{
                Text((months[month]))
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                MonthView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
//            .border(Color.white, width: 3)
            .background(Color.purple.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(15) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
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
                MonthView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(8)
//            .border(Color.white, width: 3)
            .background(Color.purple.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(15) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
                )
        }
    }
    
    func showQuarters() -> some View {
        ForEach (0..<(quarters.count), id: \.self) { index in
            VStack{
                Text((quarters[index]))
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                QuarterView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 12)
            .padding(.top, 8)
            .padding(.bottom, 8)            .background(Color.pink.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(20) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
                )
        }
    }
    
    func showYears() -> some View {
        ForEach (0..<(years.count), id: \.self) { year in
            VStack{
                Text((years[year]))
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white.opacity(0.4))
                    .shadow(radius: 8)
                YearView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 15)
            .padding(.top, 5)
            .padding(.bottom, 8)
            .background(Color.orange.opacity(0.15)) // Lägg till bakgrundsfärg här
            .cornerRadius(30) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
                )
        }
    }
    
    var body: some View {
        HStack{
            MenuView(blurGridLayer: $blurGridLayer)

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
        .blur(radius: blurGridLayer ? 20 : 0.0)
            

    }
        .padding()
        .background(Color.black.opacity(0.9))
    }
}


#Preview {
    GridView(blurGridLayer: .constant(false) )
}
