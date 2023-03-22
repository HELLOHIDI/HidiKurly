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
    
    private let countLabel = UILabel()
    private lazy var categoryButton = UIButton()
    private lazy var filterButton = UIButton()
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
        countLabel.do {
            $0.text = "총 173개"
        }
        
        categoryButton.do {
            $0.setTitle("신상품순", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        filterButton.do {
            $0.setTitle("필터", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        homeNewCategoryCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.isScrollEnabled = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubviews(countLabel,categoryButton, filterButton,homeNewCategoryCollectionView)
    }
    
    private func layout() {
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
        
        categoryButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(85)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
        
        filterButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
        
        homeNewCategoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.countLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
}

extension HomeNewCategorySectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
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
