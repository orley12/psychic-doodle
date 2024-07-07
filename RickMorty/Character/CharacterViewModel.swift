//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

class CharacterViewModel: ObservableObject {
    private let repository: CharacterRepository
    
    @Published var message = ""
    @Published var character = Character()
    
    init(_ repository: CharacterRepository) {
        self.repository = repository
        
        loadCharacter()
    }

    private func loadCharacter() -> Void {
        Task {
            do {
                let character = try await repository.loadCharacter(id: 1)
                await setData(character)
            } catch let error as ApiError {
                await setError(error.message)
            } catch {
                await setError(error.localizedDescription)
            }
        }
    }
    
    private func setData(_ characters: Character) async {
        await MainActor.run {
            self.character = character
        }
    }
    
    private func setError(_ message: String) async {
        await MainActor.run {
            self.message = message
        }
    }
}
