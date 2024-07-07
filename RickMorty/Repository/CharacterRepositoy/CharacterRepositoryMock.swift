//
//  CharacterRepositoryMock.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

class CharacterRepositoryMock: CharacterRepository {
    
    var isErrorTest = false
    
    private let client: ApiClient;
    
    init(_ client: ApiClient) {
        self.client = client;
    }

    func loadCharacters() async throws -> [Character] {
        if isErrorTest {
            throw ApiError.http(error: "We unable to load characters")
        }
        
        return CharactersRespose().results
    }
    
    func loadCharacter(id: Int) async throws -> Character{
        if isErrorTest {
            throw ApiError.http(error: "We unable to load the requested character")
        }
        
        return Character()
    }
}
