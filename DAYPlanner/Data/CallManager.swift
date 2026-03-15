import Foundation

class CallManager {
    var allTasks: [[String: Any]] = []

    private static let getUrl = "https://opi23mmfy7.execute-api.eu-north-1.amazonaws.com/api/tasks"

    init() {}

    func getTasks(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData(from: CallManager.getUrl) { result in
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
    
    func postTask(from urlString: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Lägg till din autentiseringsheader här
        if let token = TokenManager.shared.bearerToken {
            request.setValue(token, forHTTPHeaderField: "Authorization")
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
