//
//  RootCoordinator.swift
//  NetworkTestApp
//
//  Created by Leonid Serebryanyy on 02.06.2021.
//

import Foundation
import UIKit

/// Координаторы управляют модулями (логическими частями приложения).
/// У каждого модуля есть входные и выходные параметры
class RootCoordinator {
	
	typealias Dependencies = AppServiceLocatorDependencies // здесь мы описываем зависимости, которые нужны координатору и его дочерним модулям. У каждого координатора могут быть свои зависимости, и свой сервис локатор. 
	
	let serviceLocator: ServiceLocator // хранит сервиссы

	var router: RouterProtocol // отвечает за навигацию
	
	init(router: RouterProtocol, serviceLocator: ServiceLocator) {
		self.router = router
		self.serviceLocator = serviceLocator
	}
	
	// MARK: - Показываем модули из координаторов
	
	func showGamesController() {
		let vc = ViewController(networkService: serviceLocator.twichService,
								itemSelectedBlock: {[weak self](item) in
									self?.showDetailedController(item)
								})
		router.showVC(vc)
	}
	
	func showDetailedController(_ model: GetGamesDataResponse) {
		let controller = ImageViewController(networkService: serviceLocator.twichService, imageUrl: model.boxArtUrl)
		router.showVC(controller)
	}
}
