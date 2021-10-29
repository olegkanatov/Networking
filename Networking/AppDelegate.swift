//
//  AppDelegate.swift
//  Networking
//
//  Created by Oleg Kanatov on 28.10.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var bgSessionComplitionHandler: (()->())?

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        
        bgSessionComplitionHandler = completionHandler
    }

}

