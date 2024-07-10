//
//  AlertItem.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 10/07/2024.
//

import Foundation

struct AlertItem: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var message: String
}
