//
//  ContentView.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 05/07/2024.
//

import SwiftUI

struct CharactersView: View {

    @StateObject private var viewModel: CharactersViewModel
    
    init() {
        let logger = LoggerFacadeImpl()
        let client = ApiClientImpl(logger)
        let repository = CharacterRepositoryImpl(client, logger)
        _viewModel = StateObject(wrappedValue: CharactersViewModel(repository, logger))
    }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(viewModel.characters) { character in
                    NavigationLink(value: character) {
                        CharacterView(character: character)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Rick & Morty Characters")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character)
            }
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .overlay(viewModel.isLoading ? OverlayView() : nil)
        .task {
            await viewModel.loadCharacters()
        }
        
    }
}


#Preview {
    CharactersView()
}
