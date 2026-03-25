//
//  Weekdays.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-25.
//

import SwiftUI




struct WeekdaysView: View {
    
    @Binding var blurGridLayer: Bool
    @State private var fullView = false
    
    @EnvironmentObject var tm: TaskManager
    @EnvironmentObject var callManager: CallManager
    
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
                DayView(tm: tm, weekday: index + 1)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .background(Color(hex:"3a9ff2")) // Lägg till bakgrundsfärg här
            .cornerRadius(5) // Rundade hörn för hela HStack
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 0) // Ramen med rundade hörn
            )
            
            .onTapGesture {
                switch index {
                case 0:
                    print("monday trycktes")
                    fullView.toggle()
                    print(fullView)
                case 1:
                    print("tues trycktes")
                case 2:
                    print("wed trycktes")
                case 3:
                    print("thur trycktes")
                case 4:
                    print("fri trycktes")
                case 5:
                    print("sat trycktes")
                case 6:
                    print("sun trycktes")
                default:
                    break
                }
            }
        }
    }
    
    var body: some View {
        
        HStack{
            LiquidView()
                .frame(width: 60)
            VStack(spacing: 4) {
                showWeekdays()
            }
            .frame(maxWidth: .infinity)
        }
        .blur(radius: blurGridLayer ? 20 : 0.0)
        .padding()
        .background(Color.black.opacity(0.9))
        .task{
            callManager.getTasksById{
                tm.incompleteTasks = callManager.getIncompleteTasks()
            }
        }
        
        
    }
    
    //    #Preview {
    //        WeekdaysView()
    //    }
    
}
