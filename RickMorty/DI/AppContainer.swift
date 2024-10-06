import Foundation

class AppContainer {
    let client: ApiClient
    let logger : LoggerFacade
    let repository: CharacterRepository
    
    init() {
        logger = LoggerFacadeImpl()
        client = ApiClientImpl(logger)
        repository = CharacterRepositoryImpl(client, logger)
    }
    
}
