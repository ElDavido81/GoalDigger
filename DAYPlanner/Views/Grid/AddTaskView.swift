//
//  StartView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-15.
//

import SwiftUI


struct AddTaskView: View {
    
    @EnvironmentObject var callManager: CallManager
    
    @State private var taskTitle: String = ""
    @State private var taskText: String = ""
    @State private var goalDate: Date = Date()
    @State private var taskValue: Int = 0
    @State private var navigateStatus = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "333333").ignoresSafeArea()
                
                GeometryReader { geo in
                    let isLandscape = geo.size.width > geo.size.height
                    
                    Group {
                        if isLandscape {
                            HStack(alignment: .top, spacing: 20) {
                                VStack(spacing: 15) {
                                    TextField("What to do?", text: $taskTitle)
                                        .padding(15)
                                        .background(Color.white)
                                        .foregroundColor(Color(hex: "333333"))
                                        .font(.system(size: 22))
                                        .fontWeight(.medium)
                                        .cornerRadius(8)
                                    
                                    TextEditor(text: $taskText)
                                        .padding(15)
                                        .background(Color.white)
                                        .foregroundColor(Color(hex: "333333"))
                                        .font(.system(size: 22))
                                        .fontWeight(.medium)
                                        .cornerRadius(8)
                                        .frame(height: 100)
                                    
                                    Button(action: submitTask) {
                                        VStack {
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
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: geo.size.width * 0.5, alignment: .leading)
                                
                                DatePicker(
                                    "",
                                    selection: $goalDate,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                                .colorScheme(.dark)
                                .labelsHidden()
                                .background(Color(hex: "333333"))
                                .frame(maxWidth: geo.size.width * 0.5)
                            }
                        } else {
                            VStack(spacing: 15) {
                                TextField("What to do?", text: $taskTitle)
                                    .padding(15)
                                    .background(Color.white)
                                    .foregroundColor(Color(hex: "333333"))
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                    .cornerRadius(8)
                                
                                TextEditor(text: $taskText)
                                    .padding(15)
                                    .background(Color.white)
                                    .foregroundColor(Color(hex: "333333"))
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                    .cornerRadius(8)
                                    .frame(height: 100)
                                
                                DatePicker(
                                    "",
                                    selection: $goalDate,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                                .colorScheme(.dark)
                                .labelsHidden()
                                .background(Color(hex: "333333"))
                                
                                Button(action: submitTask) {
                                    VStack {
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
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
    
    func submitTask() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let stringDate = formatter.string(from: goalDate)
        
        callManager.postTask(
            taskTitle: taskTitle,
            taskText: taskText,
            goalDate: stringDate,
            taskValue: taskValue,
            taskStatus: false
        ) { result in
            switch result {
            case .success:
                print("Data skickad!")
                navigateStatus = true
            case .failure(_):
                print("Error")
            }
        }
    }
}
