//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation

@MainActor final class CharactersViewModel: ObservableObject {
    private let logger: LoggerFacade
    private let repository: CharacterRepository
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var characters: [Character] = []
    
    init(_ repository: CharacterRepository, _ logger: LoggerFacade) {
        self.logger = logger
        self.repository = repository
    }
    
    func loadCharacters() async -> Void {
            do {
                setIsLoading(true)
                
               let characters = try await repository.loadCharacters()
                
                setIsLoading(false)

                setData(characters)
            } catch let error as ErrorType {
                setAndLogError(error.message)
            } catch {
                setAndLogError(error.localizedDescription)
            }
    }
    
    private func setIsLoading(_ value: Bool) {
        self.isLoading = value
    }
    
    private func setData(_ characters: [Character]) {
            self.characters = characters
    }
    
    private func setAndLogError(_ value: String) {
        setError(value)
        logError(value)
    }
    
    private func setError(_ value: String) {
            self.message = value
    }
    
    private func logError(_ value: String) {
        logger.log(error: value)
    }
}
    
    
    

