import Foundation

protocol MainPageViewModelLogic: AnyObject {
    func fetchPlayers()

    var players: Observable<[Players]> {get}
}

final class MainPageViewModel: MainPageViewModelLogic {
    
    //MARK: - Binding Values
    var players: Observable<[Players]>  = Observable([])
    
    //MARK: - Functions
    internal func fetchPlayers() {
        Router.shared.showLoader()
        ParseManager.shared.getRequest(
            url: API.players,
            parameters: [:]) {
            (result: [Players]?, error) in
                Router.shared.hideLoader()
                if let result = result {
                    self.players.value = result
                }
        }
    }
}
