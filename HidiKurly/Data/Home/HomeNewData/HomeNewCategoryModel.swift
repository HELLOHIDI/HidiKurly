//
//  HomeNewCategoryModel.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/24.
//

import UIKit

struct HomeNewCategoryModel {
    var name: String
    
    func calculateCellWidth(index:Int) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = HomeNewCategoryModel.homeNewCategoryData[index].name
        label.sizeToFit()
        print(label.frame.width)
        return label.frame.width
    }
}

extension HomeNewCategoryModel {
    static let homeNewCategoryData = [
        HomeNewCategoryModel(name: "카테고리"),
        HomeNewCategoryModel(name: "브랜드"),
        HomeNewCategoryModel(name: "가격"),
        HomeNewCategoryModel(name: "혜택"),
        HomeNewCategoryModel(name: "유형")
    ]
}


