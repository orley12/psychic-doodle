//
//  URLRequest.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

extension URLRequest {
    init(url: URL, httpMethod: String) {
        self.init(url: url)
        self.httpMethod = httpMethod
    }
}
