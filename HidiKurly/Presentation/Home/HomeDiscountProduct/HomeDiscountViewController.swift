//
//  HomeDiscountProductViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeDiscountViewController: BaseViewController {
    
    let homeDiscountView = HomeDiscountView()
    
    
    
    override func loadView() {
        self.view = homeDiscountView
    }
}
