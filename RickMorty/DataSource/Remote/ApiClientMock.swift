//
//  ApiClientMock.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

class ApiClientMock: ApiClient {
    func request(
        method: ApiMethod,
        _ endpoint: ApiEndpoint
    ) async throws -> (Data, URLResponse) {
        return (Data(), URLResponse())
    }
}
