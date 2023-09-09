import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let news = NewsViewController()
        news.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "news"), tag: 0)
        
        let roster = RosterViewController()
        roster.tabBarItem = UITabBarItem.init(title: "", image: #imageLiteral(resourceName: "roster"), tag: 1)
        
        let cs = RosterViewController()
        cs.tabBarItem = UITabBarItem.init(title: "", image: #imageLiteral(resourceName: "cs"), tag: 2)
        
        
        self.tabBar.tintColor = .blueColor
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.barTintColor = .blueColor
        self.tabBar.backgroundColor = .backgroundColor
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .backgroundColor
        self.viewControllers = [news, roster, cs]
    }
}
