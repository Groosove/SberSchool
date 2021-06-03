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
}

protocol WeatherNetworkProtocol {
    func getCountry(with county: String, completion: @escaping (WeatherResult)->Void)
}

final class WeatherNetwork {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

func getFahrenheit(valueInKelvin: Double?) -> Double {
     if let kelvin = valueInKelvin {
         return ((kelvin - 273.15) * 1.8) + 32
     } else {
         return 0
     }
 }
 
 func getCelsius(valueInKelvin: Double?) -> Double {
     if let kelvin = valueInKelvin {
         return kelvin - 273.15
     } else {
         return 0
     }
 }

struct CurrentWeatherData: Decodable {
    let coord: Coordinates
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain
    let clouds: Clouds
    let dt: Double
    let sys: Sys
    let cityId: Int
    let cityName: String
    let statusCode: Int
    
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Coordinates: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct Rain: Decodable {
        let h: Double
    }
    
    struct Main: Decodable {
        let tempKelvin: Double
        var tempFahrenheit: Double {
            return getFahrenheit(valueInKelvin: self.tempKelvin)
        }
        var tempCelcius: Double {
            return getCelsius(valueInKelvin: self.tempKelvin)
        }
        let pressure: Int
        let humidity: Int
        let minTempKelvin: Double
        let maxTempKelvin: Double
        
        private enum CodingKeys: String, CodingKey {
            case tempKelvin = "temp"
            case pressure
            case humidity
            case minTempKelvin = "temp_min"
            case maxTempKelvin = "temp_max"
        }
    }
    
    struct Wind: Decodable {
        let speed: Double
        let deg: Int
    }
    
    struct Clouds: Decodable {
        let all: Int
    }
    
    struct Sys: Decodable {
        let type: Int
        let id: Int
        let message: Double
        let country: String
        let sunrise: Double
        let sunset: Double
    }
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case coord
        case base
        case main
        case visibility
        case wind
        case rain
        case clouds
        case dt
        case sys
        case cityId = "id"
        case cityName = "name"
        case statusCode = "cod"
    }
    
}

typealias WeatherResult = Result<CurrentWeatherData, WeatherError>

extension WeatherNetwork: WeatherNetworkProtocol {
    func getCountry(with county: String, completion: @escaping (WeatherResult) -> Void) {
        
        // URL
        var components = URLComponents(string: Key.WeaterMethod.getCountry)
        components?.queryItems = [
            URLQueryItem(name: "q", value: county),
            URLQueryItem(name: "appid", value: Key.WeatherKey.weatherClientID)
        ]
        guard let url = components?.url else { completion(.failure(.network)); return }
        print(url)
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        typealias Handler = (Data?, URLResponse?, Error?) -> Void
        // Handelr
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode(CurrentWeatherData.self, from: data)
                completion(.success(response))
            } catch let error as WeatherError { completion(.failure(error)); print("Bad data") }
            catch { completion(.failure(.decodable)); print("Bad response") }
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
