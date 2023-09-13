import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let news = NewsViewController()
        let newsImage = UIImage(named: "news")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 30, height: 30))
        news.tabBarItem = UITabBarItem(title: "Новости", image: newsImage, tag: 0)

        let roster = RosterViewController()
        let rosterImage = UIImage(named: "roster")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 30, height: 30))
        roster.tabBarItem = UITabBarItem(title: "Состав", image: rosterImage, tag: 1)

        let cs = RosterViewController()
        let csImage = UIImage(named: "cs")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 30, height: 30))
        cs.tabBarItem = UITabBarItem(title: "Гайды", image: csImage, tag: 2)
        
        
        self.tabBar.tintColor = .blueColor
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.barTintColor = .blueColor
        self.tabBar.backgroundColor = .backgroundColor
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .backgroundColor
        self.viewControllers = [news, roster, cs]
    }
}
