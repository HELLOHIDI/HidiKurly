//
//  MenuTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class MenuTabBarController: BaseViewController {
    let menuTabbarView = MenuTabbarView()
    override func loadView() {
        self.view = menuTabbarView
    }
}
