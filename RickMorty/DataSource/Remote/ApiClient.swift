//
//  ApiClient.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

protocol ApiClient {
    func request(
        method: ApiMethod,
        _ endpoint: ApiEndpoint
    ) async throws -> (Data, URLResponse)
}
