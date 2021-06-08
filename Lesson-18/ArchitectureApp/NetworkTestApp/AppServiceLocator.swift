//
//  AppServiceLocator.swift
//  NetworkTestApp
//
//  Created by Leonid Serebryanyy on 02.06.2021.
//

import Foundation

// зависимости нужного нам сервис локатора
protocol AppServiceLocatorDependencies: HasTwichNetworkService {}


/// передаёт зависимости в модуль (может их создавать)
class ServiceLocator: AppServiceLocatorDependencies {
	lazy var twichService: TwitchNetworkServiceProtocol = TwitchNetworkService()
}
