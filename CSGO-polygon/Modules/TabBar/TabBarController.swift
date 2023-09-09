import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let news = NewsViewController()
        let roster = RosterViewController()
        let cs = RosterViewController()
        
        news.tabBarItem = UITabBarItem(title: "Новости", image: nil, tag: 0)
        roster.tabBarItem = UITabBarItem(title: "Состав", image: nil, tag: 1)
        cs.tabBarItem = UITabBarItem(title: "Тренировки", image: nil, tag: 2)
        
        let fontSize: CGFloat = 20.0
        
        news.tabBarItem.title = "Новости"
        news.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)], for: .normal)
        
        roster.tabBarItem.title = "Состав"
        roster.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)], for: .normal)
        
        cs.tabBarItem.title = "Тренировки"
        cs.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)], for: .normal)
        
        self.tabBar.tintColor = .blueColor
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.backgroundColor = .clear
        self.viewControllers = [news, roster, cs]
    }
}
