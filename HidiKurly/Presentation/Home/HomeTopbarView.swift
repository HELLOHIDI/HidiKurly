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
    
    let topView = UIView()
    let logoImage = UIImageView()
    let locationButton = UIButton()
    let cartButton = UIButton()
    public lazy var homePageTabbarCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        homePageTabbarCollectionView.register(
            HomePageTabbarCollectionViewCell.self,
            forCellWithReuseIdentifier: HomePageTabbarCollectionViewCell.cellIdentifier
        )
    }
    
    private func style() {
        topView.do {
            $0.backgroundColor = .purple
        }
        
        logoImage.do {
            $0.image = Image.homeLogo
        }
        
        locationButton.do {
            $0.backgroundColor = .blue
        }
        
        cartButton.do {
            $0.backgroundColor = .blue
        }
        
        homePageTabbarCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            $0.backgroundColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubviews(topView, homePageTabbarCollectionView)
        topView.addSubviews(logoImage, locationButton, cartButton)
    }
    
    private func layout() {
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
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
        
        homePageTabbarCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
