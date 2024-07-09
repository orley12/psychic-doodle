//
//  OverlayView.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}
