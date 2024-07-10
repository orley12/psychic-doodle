//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 06/07/2024.
//

import Foundation
import SwiftUI

@MainActor final class CharactersViewModel: ObservableObject {
    private let logger: LoggerFacade
    private let repository: CharacterRepository
    
    @Published var alert: AlertItem?
    @Published var isLoading = false
    @Published var characters: [Character] = []
    
    init(_ repository: CharacterRepository, _ logger: LoggerFacade) {
        self.logger = logger
        self.repository = repository
    }
    
    func loadCharacters() async -> Void {
        setIsLoading(true)
        
        do {
            let characters = try await repository.loadCharacters()
            
            setData(characters)
        } catch let error as ErrorType {
            handleError(error)
        } catch {
            handleError(ErrorType.client(error: error.localizedDescription))
        }
        
        setIsLoading(false)
        
    }
    
    private func setIsLoading(_ value: Bool) {
        self.isLoading = value
    }
    
    private func setData(_ characters: [Character]) {
            self.characters = characters
    }
    
    private func handleError(_ value: ErrorType) {
        setAlert(value)
        logError(value)
    }
    
    private func setAlert(_ value: ErrorType) {
        self.alert = AlertItem(title: value.title, message: value.message)
    }
    
    private func logError(_ value: ErrorType) {
        logger.log(error: value.message)
    }
}
    
    
    

