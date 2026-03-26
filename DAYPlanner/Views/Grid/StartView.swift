//
//  StartView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-15.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var callManager: CallManager
    
    @State private var todayTitle: String = ""
    @State private var todayText: String = ""
    @State private var nextMonthTitle: String = ""
    @State private var nextMonthText: String = ""
    @State private var threeYearsTitle: String = ""
    @State private var threeYearsText: String = ""
    @State private var navigateStatus = false
    var threeYearsDate: Date?
    var todayDate = Date()
    var nextMonthDate: Date?
    
    
//    init() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        todayDate = dateFormatter.string(from: Date())
        
//        let threeYearsDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
//        {
//            threeYearsDate = dateFormatter.string(from: threeYearsLater)
//        } else {
//            threeYearsDate = ""
//            
//        }

//        let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) {
//            nextMonthDate = dateFormatter.string(from: oneMonthLater)
//        }
//        else {
//            nextMonthDate = ""
//        }
//    }
    
    init() {
//        todayDate = Date()
        
        
        threeYearsDate = Calendar.current.date(byAdding: .year, value: 2, to: todayDate)

        
        nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: todayDate)
    }

    
    
    private func postToday() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let today = dateFormatter.string(from: todayDate)

        callManager.postTask(taskTitle: todayTitle, taskText: todayText, goalDate: today, taskValue: 10, taskStatus: false, completion: { result in
            switch result {
            case .success:
                print("Data skickad!")
                navigateStatus = true
            case .failure(_):
                print("Error: (error.localizedDescription)")
            }}
        )
    }
    
    private func postThreeYear() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let threeYearsLater = threeYearsDate else {
                   return
               }
        let threeYearsLaterS = dateFormatter.string(from: threeYearsLater)
        
        callManager.postTask(taskTitle: threeYearsTitle, taskText: threeYearsText, goalDate: threeYearsLaterS, taskValue: 1000, taskStatus: false, completion: { result in
            switch result {
            case .success:
                print("Data skickad!")
                navigateStatus = true
            case .failure(_):
                print("Error: (error.localizedDescription)")
            }}
        )
    }

    private func postNextMonth() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let oneMonthLater = nextMonthDate else {
                   return
               }
        
        let oneMonthLaterS = dateFormatter.string(from: oneMonthLater)

        callManager.postTask(taskTitle: nextMonthTitle, taskText: nextMonthText, goalDate: oneMonthLaterS, taskValue: 100, taskStatus: false, completion: { result in
            switch result {
            case .success:
                print("Data skickad!")
                navigateStatus = true
            case .failure(_):
                print("Error: (error.localizedDescription)")
            }}
        )
    }
    
    
    
    var body: some View {
        
        
        //            var currentUsername: String {
        //                UserDefaults.standard.string(forKey: "loggedInUsername") ?? ""
        
        NavigationStack {
            ZStack{
                Color(hex: "333333").ignoresSafeArea()
                
                VStack{
                    //            Text("Hello \(currentUsername)")
                    Text("Today")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    TextField("...I need to:", text: $todayTitle)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(8)
                    Text("Next month")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    TextField("...I want to:", text: $nextMonthTitle)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(20)
                    Text("In 3 years")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    TextField("...I will:", text: $threeYearsTitle)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(50)
                    Rectangle()
                        .frame(height: 20)
                        .hidden()
                    Button(action: {
                        postToday()
                        postThreeYear()
                        postNextMonth()
                    })
                    {
                        VStack{
                            Text("Let's")
                            Text("goal!")
                        }
                        .padding(25)
                        .background(Color(hex: "99CCCC"))
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.heavy)
                        .cornerRadius(150)
                    }
                    .navigationDestination(isPresented: $navigateStatus) {
                        DynamicView()
                            .navigationBarHidden(true)
                    }
                }
                .padding(40)
            }
        }
    }
    
}
    #Preview {
        StartView()
    }
