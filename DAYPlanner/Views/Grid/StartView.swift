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
    @State private var threeYearsTitle: String = ""
    @State private var threeYearsText: String = ""
    @State private var navigateStatus = false
    let threeYearsDate: String
    let todayDate: String

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

    

    var body: some View {
        
        
        VStack{
            var currentUsername: String {
                UserDefaults.standard.string(forKey: "loggedInUsername") ?? ""
            }
            Text("Hello \(currentUsername)")
            Text("Today I need to...")
            TextField("", text: $todayTitle)
                .autocapitalization(.none)
            TextField("", text: $todayText)
            Text("In 3 years I will...")
            TextField("", text: $threeYearsTitle)
            TextField("", text: $threeYearsText)
            
            NavigationStack {
                Button(action: {
                    postToday()
                    postThreeYear()
                })
                {
                    Text("Let's goal!")
                }
                   .navigationDestination(isPresented: $navigateStatus) {
                       GridView(blurGridLayer: $blurGridLayer)
                           .navigationBarHidden(true)
                   }
               }
            }
        .padding()
    }
}

#Preview {
    StartView()
}
