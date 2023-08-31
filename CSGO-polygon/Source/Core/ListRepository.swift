import Foundation

protocol ListRepositoryLogic: AnyObject {
    func getLanguages(completion: (([Language])->())?)
    func getCities(completion: (([City])->())?)
}

class ListRepository: ListRepositoryLogic{
    
    static let shared = ListRepository()
    
    init() {}
    
    func getLanguages(completion: (([Language])->())?) {
        Router.shared.showLoader()
        ParseManager.shared.getRequest(
            url: API.languages,
            parameters: [:]) {
            (result: [Language]?, error) in
                Router.shared.hideLoader()
                if let result = result {
                    completion?(result)
                }
        }
    }
    func getCities(completion: (([City]) -> ())?) {
        Router.shared.showLoader()
        ParseManager.shared.getRequest(
            url: API.cities,
            parameters: [:]) {
            (result: [City]?, error) in
                Router.shared.hideLoader()
                if let result = result {
                    completion?(result)
                }
        }
    }
    
}
