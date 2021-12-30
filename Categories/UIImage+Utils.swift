//
//  UIImage+Utils.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import UIKit

extension UIImage {
    
    class var search: UIImage? {
        return UIImage(systemName: "magnifyingglass")
    }
    
    static var sun: UIImage? {
        return UIImage(systemName: "sun.max.fill")
    }
    
    static var settings: UIImage?  {
        return UIImage(systemName: "gear")
    }
}
