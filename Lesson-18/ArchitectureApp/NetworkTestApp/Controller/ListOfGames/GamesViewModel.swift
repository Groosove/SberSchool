//
//  GamesViewModule.swift
//  NetworkTestApp
//
//  Created by Leonid Serebryanyy on 02.06.2021.
//

import Foundation

protocol GamesPresenterProtocol: AnyObject {
	func requestData()
	func itemSelected(_ index: Int)
}


class GamesPresenter: GamesPresenterProtocol {
	
	// MARK: - Dependencies
	
	private let networkService: TwitchNetworkServiceProtocol
	
	// MARK: - Internal Properties
	
	private var cursor: String?
	
	private weak var view: GamesView?
	
	private var itemSelectedBlock: (GetGamesDataResponse)-> Void
	
	init(view: GamesView,
		 networkService: TwitchNetworkServiceProtocol,
		 itemSelectedBlock: @escaping (GetGamesDataResponse)-> Void
	) {
		self.networkService = networkService
		self.view = view
		self.itemSelectedBlock = itemSelectedBlock
	}
	
	var items = [GetGamesDataResponse]()
	var gameItems = [GameItem]()
	
	var error: Error?
	
	func requestData() {
		self.loadData()
	}
	
	func itemSelected(_ index: Int) {
		itemSelectedBlock(items[index])
	}

	
	func loadData() {
//		isLoading = true
		networkService.authorize { isAuthorized in
			if isAuthorized {
				self.networkService.getGames(after: nil) { self.process($0) }
			} else {
				DispatchQueue.main.async {
//					self.showAlert(for: .unauthorize)
				}
			}
		}
	}
	
	private func process(_ response: GetGamesAPIResponse) {
		DispatchQueue.main.async {
			switch response {
			case .success(let data):
				self.cursor = data.pagination.cursor
				self.items.append(contentsOf: data.data)
				self.gameItems.append(contentsOf: data.data.map {GameItem(title: $0.name)})
				
				self.view?.showGames(self.gameItems)
			case .failure(let error):
//				self.showAlert(for: error)
				break
			}
//			self.isLoading = false
		}
	}
}
