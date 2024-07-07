//
//  ApiError.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

enum ApiError: Error {
    case http(error: String)
    case client(error: String)
    
    var message: String {
        switch self {
        case let .http(msg),
            let .client(msg):
            return msg
        }
    }
}
