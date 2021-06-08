//
//  TwitchNetworkServiceProtocol.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 28.05.2021.
//

import Foundation

protocol HasTwichNetworkService {
	var twichService: TwitchNetworkServiceProtocol {get}
}


typealias GetGamesAPIResponse = Result<GetGamesResponse, NetworkServiceError>

protocol TwitchNetworkServiceProtocol {
    func authorize(completion: @escaping (Bool) -> Void)
    func getGames(after cursor: String?, completion: @escaping (GetGamesAPIResponse) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}
