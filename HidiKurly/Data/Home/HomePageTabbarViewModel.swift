//
//  HomePageTabbarViewModel.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/17.
//

import UIKit

final class HomePageTabbarViewModel {
    
    var updatePageViewControllerClosuer: (() -> Void)?
    var updatePageTabbarClosuer: (() -> Void)?
    
    var homePageTabbarList: [HomePageTabbarModel] = HomePageTabbarModel.homePageTabbarData
    
    // 현재 인덱스
    var preIndex: Int = 0
    var tabbarIndex: Int = 0
    var direction: UIPageViewController.NavigationDirection = .forward
    
    func checkDirection() -> UIPageViewController.NavigationDirection {
        direction = preIndex < tabbarIndex ? .forward : .reverse
        preIndex = tabbarIndex
        return direction
    }
    
    func updatePageViewControllerState() {
        for index in 0..<homePageTabbarList.count {
            homePageTabbarList[index].isSelected = index == self.tabbarIndex ? true : false
        }
    }
    
    func updatePageTabbarViewState(index: Int) {
        tabbarIndex = index
        for index in 0..<homePageTabbarList.count {
            homePageTabbarList[index].isSelected = index == self.tabbarIndex ? true : false
        }
    }
}

