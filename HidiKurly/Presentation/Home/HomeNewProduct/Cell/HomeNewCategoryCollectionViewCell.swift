//
//  HomeNewCategoryCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit

import SnapKit
import Then

class HomeNewCategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var homeNewCategoryView = UIView()
    private lazy var homeNewCategoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {}
    
    private func style() {
        homeNewCategoryView.do {
            $0.makeCornerRadius(ratio: 12)
        }
        
        homeNewCategoryLabel.do {
            $0.text = "카테고리"
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(homeNewCategoryView,homeNewCategoryLabel)
    }
    
    private func layout() {
        homeNewCategoryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(15)
            $0.height.equalTo(10)
        }
        
        homeNewCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(self.homeNewCategoryView).offset(3)
            $0.centerX.equalToSuperview()
        }
    }
}
    

