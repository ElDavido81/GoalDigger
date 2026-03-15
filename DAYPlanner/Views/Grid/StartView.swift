////
////  StartView.swift
////  DAYPlanner
////
////  Created by David Kalitzki on 2026-03-15.
////
//
//import SwiftUI
//
//struct StartView: View {
//    
//    private let authManager = AuthManager()
//
//    @State private var todayTitle: String
//    @State private var threeYearsTitle: String
//    @State private var navigateStatus = false
//    let threeYearsDate: String
//    let todayDate: String
//
//    init() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        todayDate = dateFormatter.string(from: Date())
//
//        if let threeYearsLater = Calendar.current.date(byAdding: .year, value: 3, to: Date()) {
//            threeYearsDate = dateFormatter.string(from: threeYearsLater)
//        } else {
//            threeYearsDate = ""
//        }
//    }
//    
//    
//    private func postToday() {
//        authManager.postTask(title: $todayTitle, createdAt: $todayDate, goalDate: $todayDate, status: false, taskValue: 10, completion: { result in
//            switch result {
//            case .success:
//                print("Data skickad!")
//                navigateStatus = true
//            case .failure(_):
//                print("Error: (error.localizedDescription)")
//            }}
//            )
//    }
//
//    private func postThreeYear() {
//        authManager.postTask(title: $threeYearsTitle, createdAt: $todayDate, goalDate: $threeYearsDate, status: false, taskValue: 10, completion: { result in
//            switch result {
//            case .success:
//                print("Data skickad!")
//                navigateStatus = true
//            case .failure(_):
//                print("Error: (error.localizedDescription)")
//            }}
//            )
//    }
//
//
//    var body: some View {
//        
//        
//        VStack{
//            Text("Today I need to...")
//            TextField("", text: $todayTitle)
//                .autocapitalization(.none)
//            Text("In 3 years I will...")
//            TextField("", text: $threeYearsTitle)
//            
//            NavigationStack {
//                Button(action: {
//                    postToday()
//                    postThreeYear()
//                })
//                {
//                    Text("Let's goal!")
//                }
//                   .navigationDestination(isPresented: $navigateStatus) {
//                       StartView()
//                   }
//               }
//            }
//        .padding()
//    }
//}
//
//#Preview {
//    StartView()
//}
