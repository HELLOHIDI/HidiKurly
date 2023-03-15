//
//  HomeTabbarView.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

class HomeTopbarView: UIView {
    
    //MARK: Properties
    
    let logoImage = UIImageView()
    let locationButton = UIButton()
    let cartButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        
        self.backgroundColor = .purple
        
        logoImage.do {
            $0.image = Image.homeLogo
        }
        
        locationButton.do {
            $0.backgroundColor = .blue
            
        }
        
        cartButton.do {
            $0.backgroundColor = .blue
            
        }
    }
    
    private func hierarchy() {
        addSubviews(logoImage, locationButton, cartButton)
    }
    
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        locationButton.snp.makeConstraints {
            $0.top.equalTo(logoImage)
            $0.leading.equalTo(self.logoImage.snp.trailing).offset(170)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        cartButton.snp.makeConstraints {
            $0.top.equalTo(logoImage)
            $0.leading.equalTo(self.logoImage.snp.trailing).offset(240)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
    }
}
