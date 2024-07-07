//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

class CharactersViewModel: ObservableObject {
    private let repository: CharacterRepository
    
    @Published var message = ""
    @Published var characters = [Character]()
    
    init(_ repository: CharacterRepository) {
        self.repository = repository
        
        Task {
            await loadCharacters()
        }
    }
    
    func loadCharacters() async -> Void {
            do {
               let characters = try await repository.loadCharacters()
                await setData(characters)
            } catch let error as ApiError {
                await setError(error.message)
            } catch {
                await setError(error.localizedDescription)
            }
    }
    
    private func setData(_ characters: [Character]) async {
        await MainActor.run {
            self.characters = characters
        }
    }
    
    private func setError(_ message: String) async {
        await MainActor.run {
            self.message = message
        }
    }
}
    
    
    

