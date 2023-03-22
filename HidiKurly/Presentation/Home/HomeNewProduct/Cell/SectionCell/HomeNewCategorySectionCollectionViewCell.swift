//
//  HomeNewCategorySectionCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit

import SnapKit
import Then

class HomeNewCategorySectionCollectionViewCell: UICollectionViewCell {
    
    private lazy var homeNewCategoryCollectionView = UICollectionView(
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
        homeNewCategoryCollectionView.delegate = self
        homeNewCategoryCollectionView.dataSource = self
        
        homeNewCategoryCollectionView.register(HomeNewCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeNewCategoryCollectionViewCell.cellIdentifier)
    }
    
    private func style() {
        homeNewCategoryCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            $0.isScrollEnabled = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .yellow
        }
    }
    
    private func hierarchy() {
        self.addSubview(homeNewCategoryCollectionView)
    }
    
    private func layout() {
        homeNewCategoryCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeNewCategorySectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 10)
    }
}

extension HomeNewCategorySectionCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeNewCategoryCollectionViewCell.cellIdentifier, for: indexPath)
                as? HomeNewCategoryCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
