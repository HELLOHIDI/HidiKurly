//
//  HomeNewProductViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeNewViewController: BaseViewController {
    
    let homeNewProductView = HomeNewProductView()
    
    
    
    override func loadView() {
        self.view = homeNewProductView
    }
}
