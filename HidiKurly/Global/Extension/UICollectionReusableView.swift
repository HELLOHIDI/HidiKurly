//
//  UICollectionReusableView.swift
//  HidiKurly
//
//  Created by 류희재 on 2023/03/08.
//

import UIKit

extension UICollectionReusableView{
    static var reuseCellIdentifier  : String {
        return String(describing: self)
    }
}
