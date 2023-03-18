//
//  HomePageTabbarModel.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/17.
//

struct HomePageTabbarModel {
    let title: String
    var isSelected: Bool
}

extension HomePageTabbarModel {
    static let homePageTabbarData: [HomePageTabbarModel] = [
        HomePageTabbarModel(title: "컬리추천", isSelected: true),
        HomePageTabbarModel(title: "신상품", isSelected: false),
        HomePageTabbarModel(title: "베스트", isSelected: false),
        HomePageTabbarModel(title: "알뜰쇼핑", isSelected: false),
        HomePageTabbarModel(title: "특가/혜택", isSelected: false)
    ]
}
