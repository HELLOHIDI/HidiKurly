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
            layout.scrollDirection = .vertical
            
            $0.isScrollEnabled = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubview(homeNewProductCollectionView)
    }
    
    private func layout() {
        homeNewProductCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}

extension HomeNewProductSectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 45) / 2
        return CGSize(width: width, height: 300)
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
