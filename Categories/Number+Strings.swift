//
//  String+Utils.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

extension Int {
    
    var celsiusValue: String {
        return String(format: "celsius_format".localized(), String(self))
    }
    
    var kmhValue: String {
        return String(format: "kmh_format".localized(), String(self))
    }
}
