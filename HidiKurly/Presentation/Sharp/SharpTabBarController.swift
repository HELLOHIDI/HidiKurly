//
//  SharpTabBarController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class SharpTabBarController: BaseViewController {
    let sharpTabbarView = SharpTabbarView()
    override func loadView() {
        self.view = sharpTabbarView
    }
}
