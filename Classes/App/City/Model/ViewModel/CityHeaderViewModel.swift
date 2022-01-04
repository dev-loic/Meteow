//
//  CityHeaderViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import UIKit

struct CityHeaderViewModel {
    let cityName: String
    let countryName: String
    let currentTemperature: String
    let explanation: String
    let weatherIconImage: UIImage?
    
    static let empty = CityHeaderViewModel(
        cityName: "",
        countryName: "",
        currentTemperature: "",
        explanation: "",
        weatherIconImage: nil
    )
}
