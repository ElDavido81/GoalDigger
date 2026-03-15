import Foundation

class CallManager {
    var allTasks: [[String: Any]] = []

    private static let url = "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/tasks"

    init() {}

    func getTasks(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData(from: CallManager.url) { result in
            switch result {
            case .success(let json):
                if let items = json["Items"] as? [[String: Any]] {
                    DispatchQueue.main.async {
                        self.allTasks = items
                        print("Alla tasks har hämtats: \(self.allTasks)")
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

    func getIncompleteTasks() -> [String] {
        return allTasks.compactMap { item -> String? in
            if let taskTitle = item["taskTitle"] as? String, let taskStatus = item["taskStatus"] as? Bool, !taskStatus {
                return taskTitle
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

}
