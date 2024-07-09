//
//  CharacterView.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: Character
    
    init(_ character: Character) {
        self.character = character
    }
    
    var body: some View {
        VStack {
            NetworkImageView(
                url: URL(string: character.image),
                height: 300,
                contentMode: .fill
            )
            .padding(.bottom, 8)
            
            VStack {
                KeyValueTextView(
                    key: "Name" ,
                    value: character.name,
                    padding: 8
                )
                
                KeyValueTextView(
                    key: "Status",
                    value: character.status,
                    padding: 8
                )
                
                KeyValueTextView(
                    key: "Gender",
                    value: character.gender,
                    padding: 8
                )
                
                KeyValueTextView(
                    key: "Location",
                    value: character.location.name,
                    padding: 8
                )

            }
            
            Spacer()
            
            
        }
        .padding(.all, 16)
    }
}

#Preview {
    CharactersView()
}
