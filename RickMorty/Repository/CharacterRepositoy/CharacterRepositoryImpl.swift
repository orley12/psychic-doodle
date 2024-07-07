//
//  CharacterRepositoyImpl.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

class CharacterRepositoryImpl: CharacterRepository {
    
    private let client: ApiClient;
    
    init(_ client: ApiClient) {
        self.client = client;
    }

    func loadCharacters() async throws -> [Character] {
        let (data, response) =  try await client.request(method: .get, .characters)
        
        guard let response =
                response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.http(error: "We unable to load characters")
        }
        
        return try JSONDecoder().decode(CharactersRespose.self, from: data).results
    }
    
    func loadCharacter(id: Int) async throws -> Character{
        let (data, response) =  try await client.request(method: .get, .character(id: id))
        
        guard let response =
                response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.http(error: "We unable to load the requested character")
        }
        
        return try JSONDecoder().decode(Character.self, from: data)
    }
}

