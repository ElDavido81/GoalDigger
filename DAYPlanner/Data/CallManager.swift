import Foundation

class CallManager: ObservableObject {
    var allTasks: [[String: Any]] = []
    
    private static let url = "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/tasks"
    
    init() {}
    
    func getTasksById(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData(from: CallManager.url) { result in
            switch result {
            case .success(let json):
                if let items = json["Items"] as? [[String: Any]] {
                    if let currentUserId = UserDefaults.standard.string(forKey: "loggedInUsername") {
                        let userItems = items.filter { item in
                            if let userId = item["userId"] as? String {
                                return userId == currentUserId
                            }
                            return false
                        }
                        DispatchQueue.main.async {
                            self.allTasks = userItems
                            print("Användarens tasks har hämtats: \(self.allTasks)")
                            completion()
                        }
                    } else {
                        print("Inget användar-ID hittades i UserDefaults.")
                        completion()
                    }
                } else {
                    print("Kunde inte hämta Items eller tomt")
                    completion()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error.localizedDescription)")
                    completion()
                }
            }
        }
    }
    
    func getIncompleteTasks() -> [Task] {
        return allTasks.compactMap { item -> Task? in
            if let id = item["id"] as? String,
               let taskTitle = item["taskTitle"] as? String,
               let taskText = item["taskText"] as? String,
               let createdAt = item["createdAt"] as? String,
               let goalDate = item["goalDate"] as? String,
               let taskValue = item["taskValue"] as? Int,
               let taskStatus = item["taskStatus"] as? Bool,
               !taskStatus {
                return Task(id: id, taskTitle: taskTitle, createdAt: createdAt, goalDate: goalDate, taskValue: taskValue, taskText: taskText, taskStatus: taskStatus)
            }
            return nil
        }
    }
    
    func postTask(taskTitle: String, taskText: String, goalDate: String, taskValue: Int, taskStatus: Bool, completion: @escaping (Result<[String: Any], Error>) -> Void){
        guard let url = URL(string: "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/tasks") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        if let token = TokenManager.shared.bearerToken {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData: [String: Any] = [
            "taskTitle": taskTitle,
            "taskText": taskText,
            "goalDate": goalDate,
            "taskValue": taskValue,
            "taskStatus": taskStatus
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: postData, options: [])
            request.httpBody = jsonData
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("JSON som skickas: \(jsonString)")
            }
            
            
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(.success(json))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func updateTaskStatus(taskId: String, status: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let url = URL(string: "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/tasks") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        // ✅ EXAKT samma som i postTask
        if let token = TokenManager.shared.bearerToken {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // ✅ Hämta userId på samma sätt som du gör i andra delar
        guard let userId = UserDefaults.standard.string(forKey: "loggedInUsername") else {
            completion(.failure(NSError(domain: "No userId", code: 0)))
            return
        }
        
        let body: [String: Any] = [
            "userId": userId,
            "id": taskId,
            "taskStatus": status
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(NSError(domain: "No response", code: 0)))
                    return
                }
                
                print("Status:", httpResponse.statusCode)
                
                if let data = data, let text = String(data: data, encoding: .utf8) {
                    print("Response:", text)
                }
                
                if 200..<300 ~= httpResponse.statusCode {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "Invalid response", code: httpResponse.statusCode)))
                }
            }
        }.resume()
    }
}
