//
//  CharacterView.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterViewModel
    
    init() {
        let client = ApiClientImpl()
        let repository = CharacterRepositoryImpl(client)
        _viewModel = StateObject(wrappedValue: CharacterViewModel(repository))
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(String(describing: viewModel.character))")
        }
        .padding()
    }
}

#Preview {
    CharactersView()
}
