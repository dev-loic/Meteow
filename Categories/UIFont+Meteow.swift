//
//  UIFont+Meteow.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import UIKit

extension UIFont {
    
    static var extraLargeBoldTitle: UIFont {
        return UIFont.systemFont(ofSize: 64.0)
    }
    
    static var bigTitle: UIFont {
        UIFont.systemFont(ofSize: 56.0)
    }
    
    static var largeTitle: UIFont {
        UIFont.systemFont(ofSize: 32.0)
    }
    
    static var text: UIFont {
        UIFont.systemFont(ofSize: 17.0)
    }
    
    static var boldText: UIFont {
        UIFont.boldSystemFont(ofSize: 17.0)
    }
}
