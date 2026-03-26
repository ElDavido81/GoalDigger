//
//  SignUpView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-11.
//

import SwiftUI

struct SignUpView: View {
    
    private let authManager = AuthManager()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var navigateStatus = false
//    @ObservedObject var tm: TaskManager


    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color(hex: "333333").ignoresSafeArea()
                
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Rectangle()
                        .frame(height: 20)
                        .hidden()
//                    TextField("First name", text: $firstname)
//                        .padding(15)
//                        .background(Color(hex: "e8e8e8"))
//                        .font(.system(size: 22))
//                        .fontWeight(.medium)
//                        .cornerRadius(50)
//                    TextField("Last name", text: $lastname)
//                        .padding(15)
//                        .background(Color(hex: "e8e8e8"))
//                        .font(.system(size: 22))
//                        .fontWeight(.medium)
//                        .cornerRadius(50)
                    TextField("E-mail", text: $email)
                        .padding(15)
                        .background(Color(hex: "e8e8e8"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(50)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                        .padding(15)
                        .background(Color(hex: "e8e8e8"))
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .cornerRadius(50)
                    Rectangle()
                        .frame(height: 20)
                        .hidden()
                    Button(action: {
                        authManager.signUp(username: email, password: password, firstname: firstname, lastname: lastname, completion: { result in
                            switch result {
                            case .success:
                                print("Data skickad!")
                                navigateStatus = true
                            case .failure(_):
                                print("Error: (error.localizedDescription)")
                            }
                        })
                        navigateStatus = true
                    })
                    {
                        VStack{
                            Text("Sign")
                            Text("up!")
                        }
                        .padding(25)
                        .background(Color(hex: "99CCCC"))
                        .foregroundColor(Color(hex: "333333"))
                        .font(.system(size: 22))
                        .fontWeight(.heavy)
                        .cornerRadius(150)
                        
                    }
                    Spacer()

                    .navigationDestination(isPresented: $navigateStatus)
                    {
                        SignInView()
                    }
                }
                .padding(40)
            }
        }
    }
}

#Preview {
    SignUpView()
}
