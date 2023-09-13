import Foundation

protocol NewsViewModelLogic: AnyObject {
    func fetchNews()

    var news: Observable<[News]> {get}
}

final class NewsViewModel: NewsViewModelLogic {
    
    //MARK: - Binding Values
    var news: Observable<[News]>  = Observable([])
    
    //MARK: - Functions
    internal func fetchNews() {
        Router.shared.showLoader()
        ParseManager.shared.getRequest(
            url: API.players,
            parameters: [:]) {
            (result: [News]?, error) in
                Router.shared.hideLoader()
                if let result = result {
                    self.news.value = result
                }
        }
    }
}
