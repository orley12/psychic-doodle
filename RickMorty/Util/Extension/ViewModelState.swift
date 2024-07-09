//
//  ViewModelState.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import Foundation

protocol ViewModelState {
    var isLoading: Published<Bool> { get set }
}

extension ViewModelState {
}
