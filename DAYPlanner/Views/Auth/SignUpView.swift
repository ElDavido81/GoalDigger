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
    @State private var blurGridLayer: Bool = false

    
    var body: some View {
        
        VStack{
            Text("Create account")
            TextField("First name", text: $firstname)
            TextField("Last name", text: $lastname)
            TextField("E-mail", text: $email)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
            
            NavigationStack {
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
                    Text("Let's goal!")
                }
                   .navigationDestination(isPresented: $navigateStatus) {
                       GridView(blurGridLayer: $blurGridLayer)
                   }
               }
        }
        .padding()
        
    }
}

#Preview {
    SignUpView()
}
