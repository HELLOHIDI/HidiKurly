//
//  File.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/14.
//

import UIKit

class SearchTabBarController: BaseViewController {
    let searchTabbarView = SearchTabbarView()
    override func loadView() {
        self.view = searchTabbarView
    }
}
