//
//  MyTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class MyTabBarController: BaseViewController {
    let myTabbarView = MyTabbarView()
    override func loadView() {
        self.view = myTabbarView
    }
}
