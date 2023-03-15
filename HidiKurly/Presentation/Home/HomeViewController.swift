//
//  HomeTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

import SnapKit

class HomeViewController: BaseViewController {
    
    let homeTopbarView = HomeTopbarView()
    let homePageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let homeKurlyRecommandViewController = HomeKurlyRecommandViewController()
    let homeNewProductViewController = HomeNewProductViewController()
    lazy var homeViewControllers = [homeKurlyRecommandViewController,homeNewProductViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hierarchy()
        layout()
        register()
        setControllers()
    }
    
    func hierarchy() {
        view.addSubview(homeTopbarView)
        addChild(homePageViewController)
        view.addSubview(homePageViewController.view)
        homePageViewController.didMove(toParent: self)
    }
    
    func layout() {
        homeTopbarView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        homePageViewController.view.snp.makeConstraints {
            $0.top.equalTo(self.homeTopbarView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func register() {
        homePageViewController.delegate = self
        homePageViewController.dataSource = self
    }
    
    func setControllers() {
        if let firstHomePageViewController = homeViewControllers.first {
            homePageViewController.setViewControllers(
                [firstHomePageViewController],
                direction: .forward,
                animated: true,
                completion: nil
            )
        }
        
    }
}

extension HomeViewController: UIPageViewControllerDelegate {}
extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = homeViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return homeViewControllers[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = homeViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == homeViewControllers.count {
            return nil
        }
        return homeViewControllers[nextIndex]
    }
}





