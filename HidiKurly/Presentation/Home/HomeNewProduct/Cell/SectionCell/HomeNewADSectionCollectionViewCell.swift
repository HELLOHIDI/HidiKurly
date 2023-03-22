//
//  HomeNewADSectionCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit

class HomeNewADSectionCollectionViewCell: UICollectionViewCell {
    
    private let homeNewADImageView = UIImageView()
    
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
        homeNewADImageView.do {
            $0.image = Image.homeAD
        }
    }
    
    private func hierarchy() {
        contentView.addSubview(homeNewADImageView)
    }
    
    private func layout() {
        homeNewADImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
