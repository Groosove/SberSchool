//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/3/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: ViewController(networkService: WeatherNetwork()))
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
}

