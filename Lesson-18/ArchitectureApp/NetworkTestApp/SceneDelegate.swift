//
//  SceneDelegate.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 28.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
	
	var rootCoordinator: RootCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let navigationController = UINavigationController()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
		
		let serviceLocator = ServiceLocator()
		
		let router = Router(nc: navigationController)
		
		self.rootCoordinator = RootCoordinator(router: router,serviceLocator: serviceLocator)
		
		self.rootCoordinator?.showGamesController()

//        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5000000)) {
//            window.rootViewController = nil
//        }
    }


}

