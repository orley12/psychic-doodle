//
//  URLComponentsExtension.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

extension URLComponents {
    init(host: String, scheme: String) {
        self.init()
        self.host = host
        self.scheme = scheme
    }
}
