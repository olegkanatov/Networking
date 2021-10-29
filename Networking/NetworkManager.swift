//
//  NetworkManager.swift
//  Networking
//
//  Created by Oleg Kanatov on 29.10.21.
//

import UIKit

class NetworkManager {
    
    static func getRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, responce, error in
            
            guard let responce = responce, let data = data else { return }
            print(responce)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func postRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let userData = ["Course": "Networking", "Lesson": "GET and POST Requests"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, responce, error in
            
            guard let data = data, let responce = responce else { return }
            
            print(responce)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func downloadImage(url: String, complition: @escaping (_ image: UIImage)->()) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    complition(image)
                }
            }
        }.resume()
    }
    
    static func fetchData(url: String, complition: @escaping (_ courses: [Course])->()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                complition(courses)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
