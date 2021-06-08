//
//  TwitchNetworkService.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 28.05.2021.
//

import Foundation

final class TwitchNetworkService {

    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private var authorizeResponse: TwitchAuthorizeResponse?

    deinit {
        print("TwitchNetworkService deinit")
    }
}

extension TwitchNetworkService: TwitchNetworkServiceProtocol {

    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    func authorize(completion: @escaping (Bool) -> Void) {
        // url
        var components = URLComponents(string: Constants.TwitchAPIMethods.authorize)
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.TwitchKeys.twitchClienID),
            URLQueryItem(name: "client_secret", value: Constants.TwitchKeys.twitchSecret),
            URLQueryItem(name: "grant_type", value: "client_credentials")
        ]
        guard let url = components?.url else { completion(false); return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // hadler
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                self.authorizeResponse = try self.decoder.decode(TwitchAuthorizeResponse.self, from: data)
                completion(true)
            } catch {
                completion(false)
            }
        }

        // call
        session.dataTask(with: request, completionHandler: handler).resume()
    }

    func getGames(after cursor: String?, completion: @escaping (GetGamesAPIResponse) -> Void) {
        // request
        var components = URLComponents(string: Constants.TwitchAPIMethods.getGames)
        components?.queryItems = [URLQueryItem(name: "after", value: cursor)]
        guard let url = components?.url,
              let token = authorizeResponse?.accessToken
        else { completion(.failure(.unknown)); return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Constants.TwitchKeys.twitchClienID, forHTTPHeaderField: "Client-Id")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        // hadler
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode(GetGamesResponse.self, from: data)
                completion(.success(response))
            } catch let error as NetworkServiceError {
                completion(.failure(error))
            } catch {
                completion(.failure(.unknown))
            }
        }

        // call
        session.dataTask(with: request, completionHandler: handler).resume()
    }

    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void) {
        // request
        let imageUrlWithSize = imageUrl.replacingOccurrences(of: "{width}x{height}", with: "375x880")
        guard let url = URL(string: imageUrlWithSize) else { completion(nil); return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)

        // hadler
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                completion(data)
            } catch {
                completion(nil)
            }
        }

        // call
        let dataTask = session.dataTask(with: request, completionHandler: handler)
        dataTask.resume()
    }

    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkServiceError.network
        }
        return data
    }
}
