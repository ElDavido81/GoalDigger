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
    @State private var blurGridLayer: Bool = false
    
    var body: some View {
        
        NavigationStack {
        VStack{
            Text("Sign in")
            TextField("E-mail", text: $email)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
            
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
                    Text("Let's goal!")
                }
                   .navigationDestination(isPresented: $navigateStatus) {

//                       GridView(blurGridLayer: $blurGridLayer)
                       StartView()
                           .navigationBarHidden(true)

                   }
               }
        }
//        .padding()
        
    }
}

//#Preview {
//    SignInView(tm: TaskManager())
//}
