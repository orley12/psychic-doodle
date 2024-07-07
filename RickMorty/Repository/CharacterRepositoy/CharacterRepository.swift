//
//  CharacterRepositoy.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

protocol CharacterRepository {
    func loadCharacters() async throws -> [Character]
    func loadCharacter(id: Int) async throws -> Character
}
