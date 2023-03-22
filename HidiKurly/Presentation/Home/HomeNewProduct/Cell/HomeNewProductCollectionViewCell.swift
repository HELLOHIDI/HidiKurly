//
//  HomeNewProductCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit

import SnapKit
import Then

class HomeNewProductCollectionViewCell: UICollectionViewCell {
    
    private let newProductImageView = UIImageView()
    private let newProductLabel = UILabel()
    private let newProductPrice = UILabel()
    
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
        contentView.backgroundColor = .systemPink
        
        newProductImageView.do {
            $0.image = Image.homeProduct
        }
        newProductLabel.do {
            $0.text = "[아펠트라] 그랴나도 IGP 파스타 2종"
            $0.numberOfLines = 2
        }
        newProductPrice.do {
            $0.text = "8900원"
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(newProductImageView, newProductLabel, newProductPrice)
    }
    
    private func layout() {
        newProductImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(150)
        }
        newProductLabel.snp.makeConstraints {
            $0.top.equalTo(self.newProductImageView.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        newProductPrice.snp.makeConstraints {
            $0.top.equalTo(self.newProductLabel.snp.bottom).offset(5)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}
    
