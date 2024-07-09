//
//  CharacterRepositoyImpl.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation
import Logger

class CharacterRepositoryImpl: CharacterRepository {
    
    private let client: ApiClient;
    private let logger: LoggerFacade;
    
    init(_ client: ApiClient, _ logger: LoggerFacade) {
        self.client = client;
        self.logger = logger;
    }

    func loadCharacters() async throws -> [Character] {
        let (data, response) =  try await client.request(method: .get, .characters)
        
        guard let response =
                response as? HTTPURLResponse, response.statusCode == 200 else {
            try FileLogger.shared?.log(error: "We unable to load characters")
            
            logger.log(
                error: "response from server was invalid \(response) when loadCharacters was called"
            )
            
            throw ErrorType.http(error: "We unable to load characters")
        }
        
        try FileLogger.shared?.log(error: "SUCCESS We are able to load characters")

        return try JSONDecoder().decode(CharactersRespose.self, from: data).results
    }
    
    func loadCharacter(id: Int) async throws -> Character{
        let (data, response) =  try await client.request(method: .get, .character(id: id))
        
        guard let response =
                response as? HTTPURLResponse, response.statusCode == 200 else {
            
            logger.log(
                error: "response from server was invalid \(response) when loadCharacter was called"
            )
            throw ErrorType.http(error: "We unable to load the requested character")
        }
        
        return try JSONDecoder().decode(Character.self, from: data)
    }
}

