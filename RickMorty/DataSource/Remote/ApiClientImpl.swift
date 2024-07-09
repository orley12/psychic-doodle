//
//  ApiClientImpl.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation


class ApiClientImpl: ApiClient {
    private let logger: LoggerFacade
    
    init(_ logger: LoggerFacade) {
        self.logger = logger
    }
    
    func request(
        method: ApiMethod,
        _ endpoint: ApiEndpoint
    ) async throws -> (Data, URLResponse) {
        
        guard let url = endpoint.url else {
            logger.log(error: "Unable to generate url when ApiClient.request was called")
            
            throw ErrorType.client(error: "An error occured please try again")
        }
        
        let urlRequest = URLRequest(url: url, httpMethod: method.rawValue)
        
        return try await URLSession.shared.data(for: urlRequest)
    }
}


