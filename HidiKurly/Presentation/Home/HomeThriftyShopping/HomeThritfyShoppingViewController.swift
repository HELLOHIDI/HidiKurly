//
//  HomeThritfyShoppingViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeThritfyShoppingViewController: BaseViewController {
    
    let homeThriftyShoppingView = HomeThriftyShoppingView()
    
    
    
    override func loadView() {
        self.view = homeThriftyShoppingView
    }
}
