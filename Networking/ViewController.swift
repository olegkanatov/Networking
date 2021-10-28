//
//  ViewController.swift
//  Networking
//
//  Created by Oleg Kanatov on 28.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getRequest(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
                
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
    
    @IBAction func postRequest(_ sender: Any) {
        
    }
    
    
    
}

