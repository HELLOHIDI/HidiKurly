//
//  HomePageTabbarCollectionViewCell.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import Foundation
import UIKit

protocol TitleButtonTappedDelegate: AnyObject {
    func titleButtonTapped(tag: Int)
}


class HomePageTabbarCollectionViewCell: UICollectionViewCell {
    
    let homePageTabbarViewModel = HomePageTabbarViewModel()
    weak var delegate: TitleButtonTappedDelegate?
    
    lazy var titleButton = UIButton()
    lazy var underLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        cellStyle()
        hierarchy()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        configCellUI()
    }
    
    func target() {
        titleButton.addTarget(self, action: #selector(titleButtonDidTap), for: .touchUpInside)
    }
    
    func cellStyle() {
        titleButton.do {
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.textAlignment = .center
        }
        
        underLineView.do {
            $0.backgroundColor = .clear
        }
    }
    
    func hierarchy() {
        contentView.addSubviews(titleButton, underLineView)
    }
    
    func layout() {
        titleButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(3)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.titleButton.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(5)
        }
    }
}

extension HomePageTabbarCollectionViewCell {
    @objc func titleButtonDidTap(sender: UIButton) {
        delegate?.titleButtonTapped(tag: sender.tag)
        homePageTabbarViewModel.updatePageViewControllerClosuer?()
    }
    
    func configCellUI() {
        titleButton.setTitleColor(.black, for: .normal)
        underLineView.backgroundColor = .black
    }
}
