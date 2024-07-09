//
//  CharacterItemView.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import SwiftUI

struct CharacterView: View {
    
    let character: Character
    
    var body: some View {
        HStack(alignment: .center) {
            NetworkImageView(
                url: URL(string: character.image),
                 width: 90,
                 height: 90
            ).padding(.trailing, 16)
                        
            VStack(alignment: .leading, spacing: 8) {
                KeyValueTextView(
                    key: "Name", 
                    value: character.name
                )
                
                KeyValueTextView(
                    key: "Status",
                    value: character.status
                )
            }
        }
    }
}

#Preview {
    CharactersView()
}
