//
//  Constants.swift
//  VKNewsFeed
//
//  Created by Давид on 10/06/2019.
//  Copyright © 2019 Давид Болотаев. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15) // размер шрифта текста в посте
    
    static let bottomViewHeight: CGFloat = 44
    
    static let bottomViewHeigth: CGFloat = 44
    static let bottomViewWidht: CGFloat = 80
    
    static let bottomViewViewsIconSize: CGFloat = 24
    
    static let minifiedPostLimitLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6
    
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
}
