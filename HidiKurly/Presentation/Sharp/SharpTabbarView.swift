//
//  SharpTabbarView.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

class SharpTabbarView: UIView {
    let view = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(view)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

