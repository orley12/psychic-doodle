//
//  Character.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

struct CharactersRespose: Decodable  {
    let results: [Character]
}

struct Character: Decodable, Identifiable, Hashable  {
    
    let id: Int
    let name: String
    let image: String
    let status: String
    let gender: String
    let location: Location
}

struct Location: Decodable, Hashable  {
    let name: String
}

extension CharactersRespose {
    init() {
        self.init(
            results:[Character()]
        )
    }
}

extension Character {
    init() {
        self.init(
            id: 0,
            name: "",
            image: "",
            status: "",
            gender: "",
            location: Location()
        )
    }
}

extension Location {
    init() {
        self.init(name: "")
    }
}
