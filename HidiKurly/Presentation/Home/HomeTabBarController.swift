//
//  HomeTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class HomeTabBarController: BaseViewController {
    let homeTabbarView = HomeTabbarView()
    override func loadView() {
        self.view = homeTabbarView
    }
}
