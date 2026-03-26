//
//  SignUpView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-11.
//

import SwiftUI

struct SignInView: View {
    
    private let authManager = AuthManager()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateStatus = false
    
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
                        authManager.signIn(username: email, password: password, completion: { result in
                            switch result {
                            case .success(let data):
                                print(String(data: data, encoding: .utf8) ?? "No response string")
                                
                                do {
                                    let decoder = JSONDecoder()
                                    let authResponse = try decoder.decode(AuthResponse.self, from: data)
                                    TokenManager.shared.bearerToken = "Bearer \(authResponse.token)"
                                    print("Token mottagen och sparad")
                                    navigateStatus = true
                                } catch {
                                    print("Fel vid JSONdecode \(error.localizedDescription)")
                                }
                            case .failure(let error):
                                print("Error: \(error.localizedDescription)")
                            }
                            
                        })
                        
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
                    Spacer()
                }
                .padding(40)
            }
                    .navigationDestination(isPresented: $navigateStatus)
                    {
                        
                        DynamicView()
                            .navigationBarHidden(true)
                    }
                }
            }
        }

#Preview {
    SignInView()
}
