//
//  NetworkManager.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(errorDescription: String?)
    case decodingError(errorDescription: String)
}

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard error == nil else {
                print("Fetch failed with error: \(error?.localizedDescription ?? " - ")")
                completionHandler(.failure(.error(errorDescription: error?.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200  else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let jsonObject = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(jsonObject))
            } catch let decodeError {
                print("Decoding Error: \(decodeError.localizedDescription)")
                completionHandler(.failure(.decodingError(errorDescription: decodeError.localizedDescription)))
            }
        }.resume()
    }
}
