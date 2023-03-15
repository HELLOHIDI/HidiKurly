//
//  KurlyTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class KurlyTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class KurlyTabbarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let kurlyTabbar = KurlyTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(kurlyTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, KurlyTabbar.self)
        self.tabBar.itemPositioning = .centered
    }
}

extension KurlyTabbarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeTabbarController = HomeViewController()
        let homeNavigationController =  UINavigationController(rootViewController: homeTabbarController)
        homeNavigationController.navigationBar.isHidden = true
        
        let sharpTabbarController = SharpTabBarController()
        let sharpNavigationController = UINavigationController(rootViewController: sharpTabbarController)
        sharpNavigationController.navigationBar.isHidden = true
        
        let menuTabbarController = MenuTabBarController()
        let menuNavigationController = UINavigationController(rootViewController: menuTabbarController)
        menuNavigationController.navigationBar.isHidden = true
        
        let searchTabbarController = SearchTabBarController()
        let searchNavigationController = UINavigationController(rootViewController: searchTabbarController)
        searchNavigationController.navigationBar.isHidden = true
        
        let myTabbarController = MyTabBarController()
        let myNavigationController = UINavigationController(rootViewController: myTabbarController)
        moreNavigationController.navigationBar.isHidden = true
        
        
        let viewControllers = [
            homeTabbarController,
            sharpTabbarController,
            menuTabbarController,
            searchTabbarController,
            myTabbarController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        
        let imageNames = [
            "home",
            "sharp",
            "menu",
            "search",
            "my"
        ]
        
        let imageSelectedNames = [
            "homeFill",
            "homeFill",
            "homeFill",
            "homeFill",
            "homeFill"
        ]
        
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
}
