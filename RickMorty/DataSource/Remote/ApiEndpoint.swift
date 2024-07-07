//
//  Endpoint.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

enum ApiEndpoint {
    case character(id: Int)
    case characters
    
    var url: URL? {
        var components = URLComponents(host: "rickandmortyapi.com", scheme: "https")
        

        switch self {
            case let .character(id):
                components.path = "/api/character/\(id)"
            case .characters:
                components.path = "/api/character"
        }
                
        return components.url
    }
}


