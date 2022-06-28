//
//  network.swift
//  practice_JSON
//

import Foundation

struct Todo: Codable, Identifiable{
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

class network {
    
    func getTodos(completion: @escaping ([Todo]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let realData = data else {
                return
            }
            
            
            do {
                let todos = try JSONDecoder().decode([Todo].self, from: realData)
                completion(todos)
            }catch {
                print(error)
                return
            }
            
            
        }).resume()
    }
}
