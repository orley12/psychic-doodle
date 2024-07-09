//
//  ApiError.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

enum ErrorType: Error {
    case none
    case http(error: String)
    case client(error: String)
    
    var message: String {
        switch self {
        case .none:
            return ""
        case
            let .http(msg),
            let .client(msg):
            return msg
        }
    }
}
