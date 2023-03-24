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
    
    private var width: Int = 0
    
    private lazy var homeNewCategoryView = UIView()
    public lazy var homeNewCategoryLabel = UILabel()
    
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
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.borderWidth = 1
            $0.makeCornerRadius(ratio: 15)
        }
        
        homeNewCategoryLabel.do {
            $0.text = "카테고리"
        }
    }
    
    private func hierarchy() {
        contentView.addSubview(homeNewCategoryView)
        homeNewCategoryView.addSubview(homeNewCategoryLabel)
    }
    
    private func layout() {
        print(width)
        homeNewCategoryView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(50)
        }
        
        homeNewCategoryLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(width-20)
            $0.height.equalTo(30)
        }
    }
}

extension HomeNewCategoryCollectionViewCell {
    func dataBind(index: Int) {
        homeNewCategoryLabel.text = HomeNewCategoryModel.homeNewCategoryData[index].name
        let viewModel = HomeNewCategoryModel(name: HomeNewCategoryModel.homeNewCategoryData[index].name)
        width = Int(viewModel.calculateCellWidth(index: index))
    }
}
