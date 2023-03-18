//
//  HomeBestProductViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeBestViewController: BaseViewController {
    
    let homeBestView = HomeBestView()
    
    
    
    override func loadView() {
        self.view = homeBestView
    }
}
