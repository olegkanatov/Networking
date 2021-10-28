//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Oleg Kanatov on 28.10.21.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
