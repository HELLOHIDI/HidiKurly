//
//  HomeNewStikcyHeaderView.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/22.
//

import UIKit
import SnapKit

import Then

class HomeNewStikcyHeaderView: UIView {
    private let countLabel = UILabel()
    private lazy var categoryButton = UIButton()
    private lazy var filterButton = UIButton()
    
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
        self.backgroundColor = .white
        
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
    }
    
    
    private func hierarchy() {
        self.addSubviews(countLabel,categoryButton, filterButton)
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
    }
}

