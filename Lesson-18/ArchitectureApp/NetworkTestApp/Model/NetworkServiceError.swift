//
//  NetworkServiceError.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 29.05.2021.
//

enum NetworkServiceError: Error {
    case unauthorize
    case network
    case decodable
    case unknown
}
