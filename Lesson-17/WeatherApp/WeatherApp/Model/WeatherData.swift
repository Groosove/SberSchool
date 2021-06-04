//
//  WeatherAppProtocol.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/3/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case network
    case decodable
    case data
    case json
}

protocol WeatherNetworkProtocol {
    func getCountry(with county: String, completion: @escaping (WeatherResult)->Void)
}

final class WeatherNetwork {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


struct WeatherData: Decodable {
    init(main: WeatherMain, jsonName: [String: Any], weather: WeatherWeather) {
        self.main = main
        self.name = jsonName["name"] as! String
        self.weather = weather
    }
    
    var main: WeatherMain
    var name: String
    var weather: WeatherWeather
}

struct WeatherMain: Decodable {
    init(json: [String: Any]) throws {
        guard let main = json["main"] as? [String: Any] else { throw WeatherError.decodable; }
        feelsLike = main["feels_like"] as? Double
        grndLevel = main["grnd_level"] as? Int
        humidity = main["humidity"] as? Int
        pressure = main["pressure"] as? Int
        seaLevel = main["seaLevel"] as? Int
        temp = main["temp"] as? Double
        tempMax = main["temp_max"] as? Double
        tempMin = main["temp_min"] as? Double
    }
    
    let feelsLike: Double?
    let grndLevel: Int?
    let humidity: Int?
    let pressure: Int?
    let seaLevel: Int?
    let temp: Double?
    let tempMax: Double?
    let tempMin: Double?
}

struct WeatherWeather: Decodable {
    init (json: [String: Any]) throws {
        guard let weather = json["weather"] as? [[String: Any]] else { throw WeatherError.decodable }
        id = weather[0]["id"] as? Int
        main = weather[0]["main"] as? String
        description = weather[0]["description"] as? String
        icon = weather[0]["icon"] as? String
    }
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

typealias WeatherResult = Result<WeatherData, WeatherError>

extension WeatherNetwork: WeatherNetworkProtocol {
    func getCountry(with county: String, completion: @escaping (WeatherResult) -> Void) {
        // URL
        var components = URLComponents(string: Key.WeaterMethod.getCountry)
        components?.queryItems = [
            URLQueryItem(name: "q", value: county),
            URLQueryItem(name: "appid", value: Key.WeatherKey.weatherClientID)
        ]
        guard let url = components?.url else { completion(.failure(.network)); return }
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        
        // Handler
        typealias Handler = (Data?, URLResponse?, Error?) -> Void
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let main = try WeatherMain(json: json)
                let weather = try WeatherWeather(json: json)
                
                let weatherData = WeatherData(main: main, jsonName: json, weather: weather)
                completion(.success(weatherData))
            } catch let error as WeatherError { completion(.failure(error));}
            catch { completion(.failure(.json)) }
        }
        
        session.dataTask(with: requset, completionHandler: handler).resume()
    }
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
            (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw WeatherError.network
        }
        return data
    }
}
