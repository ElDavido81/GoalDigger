//
//  Weekdays.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-25.
//

import SwiftUI
//
//
//
//
//struct WeekdaysView: View {
//    
//    @State private var fullView = false
//    
//    @EnvironmentObject var tm: TaskManager
//    @EnvironmentObject var callManager: CallManager
//    
//    func showWeekdays() -> some View {
//        ForEach(weekdays.indices, id: \.self) { index in
//            
//            HStack(spacing: 0) {
//                
//                Rectangle()
//                    .frame(width: 5)
//                    .opacity(0)
//                
//                Text(weekdays[index])
//                    .foregroundStyle(.black.opacity(0.3))
//                    .font(.system(size: 14))
//                    .fontWeight(.heavy)
//                Rectangle()
//                    .frame(width: 5)
//                    .opacity(0)
//                DayView(tm: tm, taskAmount: 3, weekday: index + 1)
//                Spacer()
//            }
//            .frame(maxHeight: .infinity)
//            .frame(maxWidth: .infinity)
//            .background(Color(hex:"3a9ff2")) // Lägg till bakgrundsfärg här
//            .cornerRadius(5) // Rundade hörn för hela HStack
//            .overlay(
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
//            )
//            
//            .onTapGesture {
//                switch index {
//                case 0:
//                    print("monday trycktes")
//                    fullView.toggle()
//                    print(fullView)
//                case 1:
//                    print("tues trycktes")
//                case 2:
//                    print("wed trycktes")
//                case 3:
//                    print("thur trycktes")
//                case 4:
//                    print("fri trycktes")
//                case 5:
//                    print("sat trycktes")
//                case 6:
//                    print("sun trycktes")
//                default:
//                    break
//                }
//            }
//        }
//    }
//    
//    var body: some View {
//        
//        HStack{
//            EdgeView()
//                .frame(width: 60)
//            VStack(spacing: 4) {
//                showWeekdays()
//            }
//            .frame(maxWidth: .infinity)
//        }
//        .padding()
//        .background(Color.black.opacity(0.9))
//        .task{
//            callManager.getTasksById{
//                tm.incompleteTasks = callManager.getIncompleteTasks()
//            }
//        }
//        
//        
//    }
//    
//    //    #Preview {
//    //        WeekdaysView()
//    //    }
//    
//}

struct WeekdaysView: View {
    
    @EnvironmentObject var tm: TaskManager
    @EnvironmentObject var callManager: CallManager
    
    @State private var navigateStatus = false
    @State private var selectedDate: Date = Date() // Datum som skickas till WeekdayView
    
    var body: some View {
        
        NavigationStack {
            HStack {
                EdgeView()
                    .frame(width: 60)
                
                VStack(spacing: 4) {
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
                            
                            DayView(tm: tm, taskAmount: 3, weekday: index + 1)
                            
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
                        // Navigering vid klick via switch
                        .onTapGesture {
                            let calendar = Calendar.current
                            let today = Date()
                            let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start ?? today
                            
                            switch index {
                            case 0:
                                print("Monday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 0, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 1:
                                print("Tuesday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 1, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 2:
                                print("Wednesday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 2, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 3:
                                print("Thursday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 3, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 4:
                                print("Friday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 4, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 5:
                                print("Saturday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 5, to: startOfWeek) ?? today
                                navigateStatus = true
                            case 6:
                                print("Sunday clicked")
                                selectedDate = calendar.date(byAdding: .day, value: 6, to: startOfWeek) ?? today
                                navigateStatus = true
                            default:
                                break
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.black.opacity(0.9))
            // Navigation destination
            .navigationDestination(isPresented: $navigateStatus) {
                WeekdayView(tm: tm, selectedDate: selectedDate)
            }
            .task {
                callManager.getTasksById {
                    tm.incompleteTasks = callManager.getIncompleteTasks()
                }
            }
        }
    }
}
