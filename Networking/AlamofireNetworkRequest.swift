//
//  AlamofireNetworkRequest.swift
//  Networking
//
//  Created by Oleg Kanatov on 1.11.21.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func sendRequest(url: String, complition: @escaping (_ courses: [Course])->()) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success(let value):
                
                var courses = [Course]()
                courses = Course.getArray(from: value)!
                complition(courses)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func responceData(url: String) {
        
        AF.request(url).responseData { responseData in
            
            switch responseData.result {
            case .success(let data):
                guard let string = String(data: data, encoding: .utf8) else { return }
                print(string)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func responceString(url: String) {
        
        AF.request(url).responseString { responseString in
            
            switch responseString.result {
            case .success(let string):
                print(string)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func response(url: String) {
        
        AF.request(url).response { response in
            
            guard
                let data = response.data,
                let string = String(data: data, encoding: .utf8)
            else { return }
            
            print(string)
        }
    }
}
