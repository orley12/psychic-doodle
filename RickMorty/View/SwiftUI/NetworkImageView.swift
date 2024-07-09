//
//  Image.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import SwiftUI

struct NetworkImageView: View {
    
    image
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        } placeholder: {
                            Image("food-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(String(describing: viewModel.character))")
        }
    }
}

#Preview {
    CharactersView()
}
