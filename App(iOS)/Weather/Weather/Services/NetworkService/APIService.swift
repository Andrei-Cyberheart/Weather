//
//  APIService.swift
//  Weather
//
//  Created by Andrei Ulanov on 17.07.2023.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getJSON<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T {
            guard let url = URL(string: urlString)
            else {
                throw APIError.invalidURL
            }
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard (response as? HTTPURLResponse)?.statusCode == 200
                else { throw APIError.invalidResponseStatus }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = dateDecodingStrategy
                decoder.keyDecodingStrategy = keyDecodingStrategy
                do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    return decodedData
                } catch {
                    throw APIError.decodingError(error.localizedDescription)
                }
            } catch {
                throw APIError.dataTaskError(error.localizedDescription)
            }
        }
}
