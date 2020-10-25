//
//  MainViewController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureViewControllers() {
        view.backgroundColor = .white
    
        let card = templateNavigationController(image: UIImage(systemName: "music.note.list")!, title: "Card", rootViewController: CardController())
        let info = templateNavigationController(image: UIImage(systemName: "music.note.list")!, title: "Info", rootViewController: InfoController())
        let thirdTab = templateNavigationController(image: UIImage(systemName: "music.note.list")!, title: "Tab 3", rootViewController: ThirdTabController())
        let fourthTab = templateNavigationController(image: UIImage(systemName: "music.note.list")!, title: "Tab 4", rootViewController: FourthTabController())
        let fifthTab = templateNavigationController(image: UIImage(systemName: "music.note.list")!, title: "Tab 5", rootViewController: FifthTabController())
        
        viewControllers = [card, info, thirdTab, fourthTab, fifthTab]
        
        tabBar.tintColor = .label
    }
    
    private func templateNavigationController(image: UIImage, title: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], for: .normal)
        nav.tabBarItem.selectedImage = image
        nav.tabBarItem.image = image
        return nav
    }
}
