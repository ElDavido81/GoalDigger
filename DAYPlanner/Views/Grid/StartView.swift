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
    let threeYearsDate: String
    let todayDate: String
    let nextMonthDate: String
    
    @State private var blurGridLayer = false
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        todayDate = dateFormatter.string(from: Date())
        
        if let threeYearsLater = Calendar.current.date(byAdding: .year, value: 2, to: Date()) {
            threeYearsDate = dateFormatter.string(from: threeYearsLater)
        } else {
            threeYearsDate = ""
        }

        if let oneMonthLater = Calendar.current.date(byAdding: .month, value: 1, to: Date()) {
            nextMonthDate = dateFormatter.string(from: oneMonthLater)
        } else {
            nextMonthDate = ""
        }
    }
    
    
    private func postToday() {
        callManager.postTask(taskTitle: todayTitle, taskText: todayText, goalDate: todayDate, taskValue: 10, taskStatus: false, completion: { result in
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
        callManager.postTask(taskTitle: threeYearsTitle, taskText: threeYearsText, goalDate: threeYearsDate, taskValue: 1000, taskStatus: false, completion: { result in
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
        callManager.postTask(taskTitle: nextMonthTitle, taskText: nextMonthText, goalDate: nextMonthDate, taskValue: 100, taskStatus: false, completion: { result in
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
                    TextField("Today I need to...", text: $todayTitle)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(8)
                    TextField("Next month I want to...", text: $nextMonthTitle)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(20)
                    TextField("In 3 years I will...", text: $threeYearsTitle)
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
                        GridView(blurGridLayer: $blurGridLayer)
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
