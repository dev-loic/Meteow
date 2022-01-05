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

extension UICollectionView {

    func m_fittingWidth(with layout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath) -> CGFloat {
        var additionalHorizontalInset: CGFloat = 0
        if
            let layoutDelegate = delegate as? UICollectionViewDelegateFlowLayout,
            let collectionViewInset = layoutDelegate.collectionView?(
                self,
                layout: layout,
                insetForSectionAt: indexPath.section
            ) {
            additionalHorizontalInset = collectionViewInset.totalHorizontal
        }
        return m_fittingWidth + additionalHorizontalInset
    }
}
