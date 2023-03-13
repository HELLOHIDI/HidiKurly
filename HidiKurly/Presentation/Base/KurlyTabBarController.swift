//
//  KurlyTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class KurlyTabBarController: UITabBarController {
    
    let homeTabBarViewController = UITabBarController()
    let sharpTabBarViewController = UITabBarController()
    let menuTabBarViewController = UITabBarController()
    let searchTabBarViewController = UITabBarController()
    let myTabBarViewController = UITabBarController()
    
    lazy var homeNavigationContrller = UINavigationController(rootViewController: homeTabBarViewController)
    lazy var sharpNavigationController = UINavigationController(rootViewController: sharpTabBarViewController)
    lazy var menuNavigationController = UINavigationController(rootViewController: sharpTabBarViewController)
    lazy var searchNavigationController = UINavigationController(rootViewController: sharpTabBarViewController)
    lazy var myNavigationController = UINavigationController(rootViewController: sharpTabBarViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setTabBar()
        setLayout()
        setNavigationController()
        setViewController()
        setCornerRadius()
        selectedIndex = 0
        
    }
    
    //MARK: - Custom Method
    
    private func setTabBar(){
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        //tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 130
    }
    
    private func setLayout() {
    }
    
    private func setCornerRadius(){
        tabBar.layer.cornerRadius = 24
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,
                                      .layerMaxXMinYCorner]
    }
    
    private func setNavigationController() {
        homeNavigationContrller.setNavigationBarHidden(true, animated: true)
        sharpNavigationController.setNavigationBarHidden(true, animated: true)
        menuNavigationController.setNavigationBarHidden(true, animated: true)
        searchNavigationController.setNavigationBarHidden(true, animated: true)
        myNavigationController.setNavigationBarHidden(true, animated: true)
    }
    
    private func setViewController(){
        
        homeNavigationContrller.tabBarItem = UITabBarItem(title: "",
                                                    image: Image.home,
                                                    selectedImage: Image.home)
        sharpNavigationController.tabBarItem = UITabBarItem(title: "",
                                                    image: Image.home,
                                                    selectedImage: Image.home)
        menuNavigationController.tabBarItem = UITabBarItem(title: "",
                                                    image: Image.home,
                                                    selectedImage: Image.home)
        searchNavigationController.tabBarItem = UITabBarItem(title: "",
                                                    image: Image.home,
                                                    selectedImage: Image.home)
        
        myNavigationController.tabBarItem = UITabBarItem(title: "",
                                                   image: Image.home,
                                                   selectedImage: Image.home)
        
        viewControllers = [
            homeNavigationContrller,
            searchNavigationController,
            menuNavigationController,
            searchNavigationController,
            myNavigationController
        ]
    }
}
