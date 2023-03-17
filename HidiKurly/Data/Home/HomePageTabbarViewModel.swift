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
    var index: Int = 0
    
    func updatePageViewControllerState() {
        for index in 0..<homePageTabbarList.count {
            homePageTabbarList[index].isSelected = index == self.index ? true : false
        }
    }
    
    func updatePageTabbarViewState() {
        
    }
}

