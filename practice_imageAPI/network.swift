//
//  network.swift
//  practice_imageAPI
//
//  Created by 김민령 on 2022/06/29.
//

import Foundation
import UIKit
import SwiftUI

struct User: Codable, Identifiable {
    var createdAt: String
    var name: String
    var avatar: String
    var id: String
}

class network {
    
    func getJSON(completion : @escaping ([User]) -> Void ) {
        
        guard let url = URL(string: "https://62bbeeb36b1401736cecefcf.mockapi.io/user") else {
            print("url error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let realData = data else {
                print("data error")
                return
            }
            
            do{
                let allUser = try JSONDecoder().decode([User].self, from: realData)
                completion(allUser)
            }catch{
                print("error: \(error)")
            }
            
        }.resume()
        
    }
    
}

class imageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    var urlString: String
    
    init(urlString: String){
        self.urlString = urlString
        self.loadImageURL()
    }
    
    func loadImageURL(){
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let realData = data else {
                return
            }
            guard let realImage = UIImage(data: realData) else {
                return
            }
            self.image = realImage
            
        }.resume()
        
    }
}

struct URLImage: View{
    @ObservedObject var loader: imageLoader
    
    init(urlString: String){
        self.loader = imageLoader(urlString: urlString)
    }
    
    var body: some View{
        Image(uiImage: loader.image ?? UIImage())
            .resizable()

    }
}
