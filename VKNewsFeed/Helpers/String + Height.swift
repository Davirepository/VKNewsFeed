//
//  String + Height.swift
//  VKNewsFeed
//
//  Created by Давид on 08/06/2019.
//  Copyright © 2019 Давид Болотаев. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(widht: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: widht, height: .greatestFiniteMagnitude)
        
        // возвращаем размер прямоугольника
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        // округляем высоту прямоугольника(типа CGFloat)
        return ceil(size.height)
    }
}
