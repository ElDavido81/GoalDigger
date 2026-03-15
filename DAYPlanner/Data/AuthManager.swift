//
//  AuthManager.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-11.
//

import Foundation

class AuthManager {
    
    func signUp(username: String, password: String, firstname: String, lastname: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/user/signup") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData: [String: Any] = ["username": username, "password": password, "firstname": firstname, "lastname": lastname]
        do {
                let jsonData = try JSONSerialization.data(withJSONObject: postData, options: [])
                request.httpBody = jsonData
        } catch {
            print("Error serializing JSON:", error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
        
        task.resume()
    }
    
    func signIn(username: String, password: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/user/login") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData: [String: Any] = ["username": username, "password": password]
        do {
                let jsonData = try JSONSerialization.data(withJSONObject: postData, options: [])
                request.httpBody = jsonData
        } catch {
            print("Error serializing JSON:", error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        
        task.resume()
    }
    
    
}
