//
//  KeyValueText.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import Foundation

import SwiftUI

struct KeyValueTextView: View {
    let key: String
    let value: String
    var padding: CGFloat = 0


    var body: some View {
            LabeledContent(
                LocalizedStringKey(stringLiteral: key),
                value: value
            )
            .font(.body)
            .lineLimit(1)
            .scaledToFit()
            .minimumScaleFactor(0.6)
            .padding(.vertical, padding)
    }
}
