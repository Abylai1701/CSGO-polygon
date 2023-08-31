import Foundation
import UIKit

class AppCenter{
    //MARK: - Properties
    var window: UIWindow = UIWindow()
    static let shared = AppCenter()
    
    //MARK: - Start functions
    func createWindow(_ window: UIWindow) -> Void {
        self.window = window
    }
    func start() -> Void {
        makeKeyAndVisible()
        makeRootController()
    }
    private func makeKeyAndVisible() -> Void {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
    }
    func setRootController(_ controller: UIViewController) -> Void {
        window.rootViewController = controller
    }
    //    func navigateToCreateEvent() {
    //        let vc = CreateEventWelcomeController().inNavigation()
    //        setRootController(vc)
    //    }
    func makeRootController() -> Void {
        let vc = MainPageViewController().inNavigation()
        setRootController(vc)
    }
}

