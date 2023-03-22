//
//  HomeNewProductSectionCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit

import SnapKit
import Then

class HomeNewProductSectionCollectionViewCell: UICollectionViewCell {
    
    private lazy var homeNewProductCollectionView = UICollectionView(
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
        homeNewProductCollectionView.delegate = self
        homeNewProductCollectionView.dataSource = self
        
        homeNewProductCollectionView.register(
            HomeNewProductCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeNewProductCollectionViewCell.cellIdentifier
        )
    }
    
    private func style() {
        homeNewProductCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .blue
        }
    }
    
    private func hierarchy() {
        self.addSubview(homeNewProductCollectionView)
    }
    
    private func layout() {
        homeNewProductCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeNewProductSectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension HomeNewProductSectionCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeNewProductCollectionViewCell.cellIdentifier, for: indexPath)
                as? HomeNewProductCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
