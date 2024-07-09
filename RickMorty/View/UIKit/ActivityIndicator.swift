//
//  ActivityIndicator.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    var style: UIActivityIndicatorView.Style = .large;
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        activityIndicatorView.color = .label
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
