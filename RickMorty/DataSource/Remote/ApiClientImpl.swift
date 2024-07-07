//
//  ApiClientImpl.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

class ApiClientImpl: ApiClient {
    func request(
        method: ApiMethod,
        _ endpoint: ApiEndpoint
    ) async throws -> (Data, URLResponse) {
        
        guard let url = endpoint.url else {
            throw ApiError.client(error: "An error occured please try again")
        }
        
        let urlRequest = URLRequest(url: url, httpMethod: method.rawValue)
        
        return try await URLSession.shared.data(for: urlRequest)
    }
}


