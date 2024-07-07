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
        let client = ApiClientImpl()
        let repository = CharacterRepositoryImpl(client)
        _viewModel = StateObject(wrappedValue: CharactersViewModel(repository))
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(String(describing: viewModel.characters))")
        }
        .padding()
    }
}

#Preview {
    CharactersView()
}
