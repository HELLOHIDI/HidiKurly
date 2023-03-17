//
//  HomeTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

import SnapKit

class HomeViewController: BaseViewController {
    
    private let homePageTabbarViewModel: HomePageTabbarViewModel
    
    let homeTopbarView = HomeTopbarView()
    let homePageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let homeKurlyRecommandViewController = HomeKurlyRecommandViewController()
    let homeNewViewController = HomeNewViewController()
    let homeBestViewController = HomeBestViewController()
    let homeThriftyShoppingViewController = HomeThritfyShoppingViewController()
    let homeDiscountViewController = HomeDiscountViewController()
    
    lazy var homeViewControllers = [
        homeKurlyRecommandViewController,
        homeNewViewController,
        homeBestViewController,
        homeThriftyShoppingViewController,
        homeDiscountViewController
    ]
    
    init(homePageTabbarViewModel: HomePageTabbarViewModel) {
        self.homePageTabbarViewModel = homePageTabbarViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.height.equalTo(150)
        }
        
        homePageViewController.view.snp.makeConstraints {
            $0.top.equalTo(self.homeTopbarView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func register() {
        homeTopbarView.homePageTabbarCollectionView.delegate = self
        homeTopbarView.homePageTabbarCollectionView.dataSource = self
        
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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width / 6, height: 50)
    }
}



extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageTabbarViewModel.homePageTabbarList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomePageTabbarCollectionViewCell.cellIdentifier,
            for: indexPath) as? HomePageTabbarCollectionViewCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        cell.titleButton.tag = indexPath.item
        cell.titleButton.setTitle(
            homePageTabbarViewModel.homePageTabbarList[indexPath.item].title,
            for: .normal
        )
        cell.underLineView.tag = indexPath.item
        
        if self.homePageTabbarViewModel.homePageTabbarList[indexPath.item].isSelected {
            cell.titleButton.setTitleColor(.purple, for: .normal)
            cell.underLineView.backgroundColor = .purple
        } else {
            cell.titleButton.setTitleColor(.black, for: .normal)
            cell.underLineView.backgroundColor = .black
        }
        
        cell.homePageTabbarViewModel.updatePageViewControllerClosuer = {
            self.homePageTabbarViewModel.updatePageViewControllerState()
            self.homeTopbarView.homePageTabbarCollectionView.reloadData()
        }
        
        return cell
    }
}

extension HomeViewController: TitleButtonTappedDelegate {
    func titleButtonTapped(tag: Int) {
        homePageTabbarViewModel.index = tag
        print(tag)
        homeTopbarView.homePageTabbarCollectionView.reloadData()
    }
}
