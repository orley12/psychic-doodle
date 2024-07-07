//
//  CharactersViewModelTest.swift
//  RickMortyTests
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import XCTest
@testable import RickMorty

final class CharactersViewModelTest: XCTestCase {
    var repository: CharacterRepositoryMock!
    
    override func setUp()  {
        super.setUp()
        let client = ApiClientMock()
        repository = CharacterRepositoryMock(client)
    }

    override func tearDown() {
        super.tearDown()
        repository = nil
    }
    
    func testCharactersList_ContainsOneItem_WhenCallToLoadCharactersIsSuccessful() async {
        // Given (Arrange)
        let viewModel = CharactersViewModel(repository)

        // When (Act)
        await viewModel.loadCharacters()

        // Then (Assert)
        XCTAssertEqual(viewModel.characters.count, 1)
    }
    
    func testMessage_IsEmptyString_WhenCallToLoadCharactersIsSuccessful() async {
        // Given (Arrange)
        let viewModel = CharactersViewModel(repository)

        // When (Act)
        await viewModel.loadCharacters()

        // Then (Assert)
        XCTAssertEqual(viewModel.message, "")
    }
    
    func testCharactersList_ContainsZeroItems_WhenCallToLoadCharactersIsUnSuccessful() async {
        // Given (Arrange)
        repository.isErrorTest = true
        let viewModel = CharactersViewModel(repository)

        // When (Act)
        await viewModel.loadCharacters()

        // Then (Assert)
        XCTAssertEqual(viewModel.characters.count, 0)
    }
    
    func testMessage_IsNotEmptyString_WhenCallToLoadCharactersIsUnSuccessful() async {
        // Given (Arrange)
        repository.isErrorTest = true
        let viewModel = CharactersViewModel(repository)

        // When (Act)
        await viewModel.loadCharacters()

        // Then (Assert)
        XCTAssertEqual(viewModel.message, "We unable to load characters")
    }
}
