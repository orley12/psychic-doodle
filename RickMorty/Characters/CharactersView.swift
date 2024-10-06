import SwiftUI

struct CharactersView: View {

    @StateObject private var viewModel: CharactersViewModel
    
    init() {
        let appContainer = AppContainer();
        _viewModel = StateObject(wrappedValue: CharactersViewModel(appContainer.repository, appContainer.logger))
    }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(viewModel.characters) { character in
                    NavigationLink(value: character) {
                        CharacterView(character: character)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Rick & Morty Characters")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character)
            }
            .refreshable {
                await viewModel.loadCharacters()
            }
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .overlay(viewModel.isLoading ? OverlayView() : nil)
        .task {
            await viewModel.loadCharacters()
        }
        
    }
}


#Preview {
    CharactersView()
}
