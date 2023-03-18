//
//  HomeKurlyRecommandViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeKurlyRecommandViewController: BaseViewController {
    
    let homeKurlyRecommandView = HomeKurlyRecommandView()
    
    
    
    override func loadView() {
        self.view = homeKurlyRecommandView
    }
}
