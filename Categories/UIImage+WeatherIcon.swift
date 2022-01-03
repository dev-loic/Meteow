//
//  UIImage+WeatherIcon.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

extension UIImage {
    
    // MARK: - UIImage
    
    class func weatherImage(_ weatherIcon: WeatherIcon?) -> UIImage? {
        guard let weatherIcon = weatherIcon else { return nil }
        return UIImage(systemName: weatherIcon.systemName)
    }
}
