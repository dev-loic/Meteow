//
//  String+Utils.swift
//  Meteow
//
//  Created by Loïc Saillant on 05/01/2022.
//

import Foundation

extension String {
    
    var queryized: String {
        return self.split(separator: " ").joined(separator: "%20")
    }
}
