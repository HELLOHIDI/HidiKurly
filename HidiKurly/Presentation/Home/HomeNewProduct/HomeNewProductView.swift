//
//  HomeNewProductView.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeNewProductView: UIView {
    
    public lazy var homeNewCollectionView = UICollectionView(
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
        homeNewCollectionView.register(
            HomeNewADSectionCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeNewADSectionCollectionViewCell.cellIdentifier
        )

        homeNewCollectionView.register(
            HomeNewCategorySectionCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeNewCategorySectionCollectionViewCell.cellIdentifier
        )
        homeNewCollectionView.register(
            HomeNewProductSectionCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeNewProductSectionCollectionViewCell.cellIdentifier
        )
    }

    private func style() {
        homeNewCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            $0.backgroundColor = .red
        }
    }
    
    private func hierarchy() {
        self.addSubview(homeNewCollectionView)
    }
    
    private func layout() {
        homeNewCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
