//
//  Image.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import SwiftUI

struct NetworkImageView: View {
    
    let url: URL?
    var width: CGFloat?
    let height: CGFloat?
    var contentMode: ContentMode = .fit
    
    var body: some View {
        AsyncImage(url:  url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height)
                .cornerRadius(8)
        } placeholder: {
            ActivityIndicator(style: .medium)
                .frame(
                    width: width,
                    height: height,
                    alignment: .center
                )
        }
       
    }
}

#Preview {
    NetworkImageView(
        url: URL(string: ""),
        width: 90,
        height: 90
    )
}
