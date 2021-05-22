//
//  AppDelegate.swift
//  ActivityViewController
//
//  Created by Fenix Lavon on 5/22/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

