//
//  UIScrollView+Utils.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import UIKit

extension UIScrollView {

    var m_fittingWidth: CGFloat {
        return frame.width + contentInset.totalHorizontal
    }
}
