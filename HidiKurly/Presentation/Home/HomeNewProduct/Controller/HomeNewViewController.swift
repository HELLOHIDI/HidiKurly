//
//  HomeNewProductViewController.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

class HomeNewViewController: BaseViewController {
    private lazy var homeNewProductView = HomeNewProductView()
    
    override func loadView() {
        self.view = homeNewProductView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
    }
    
    private func register() {
        homeNewProductView.homeNewCollectionView.delegate = self
        homeNewProductView.homeNewCollectionView.dataSource = self
    }
}

extension HomeNewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 500)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 110)
        case 2:
            return CGSize(width: UIScreen.main.bounds.width, height: 1500)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}

extension HomeNewViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeNewADSectionCollectionViewCell.cellIdentifier, for: indexPath)
                    as? HomeNewADSectionCollectionViewCell else { return UICollectionViewCell()}
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeNewCategorySectionCollectionViewCell.cellIdentifier, for: indexPath)
                    as? HomeNewCategorySectionCollectionViewCell else { return UICollectionViewCell()}
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeNewProductSectionCollectionViewCell.cellIdentifier, for: indexPath)
                    as? HomeNewProductSectionCollectionViewCell else { return UICollectionViewCell()}
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeNewViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 5. 핵심 - frame.minY를 통해 sticky 타이밍을 계산
        let shouldShowSticky = scrollView.contentOffset.y >= 500
        homeNewProductView.homeNewStikcyHeaderView.isHidden = !shouldShowSticky
    }
}
