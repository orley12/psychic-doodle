//
//  ApiError.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

enum ErrorType: Error {
    case http(title: String = "Http Error", error: String)
    case client(title: String = "Client Error", error: String)
    
    var message: String {
        switch self {
        case
            let .http(_, msg),
            let .client(_, msg):
            return msg
        }
    }
    
    var title: String {
        switch self {
        case
            let .http(title, _),
            let .client(title, _):
            return title
        }
    }
}
