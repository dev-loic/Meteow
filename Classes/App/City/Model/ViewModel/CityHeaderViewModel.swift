//
//  CityHeaderViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

struct CityHeaderViewModel {
    let cityName: String
    let currentTemperature: String
    let explanation: String
    
    static let empty = CityHeaderViewModel(cityName: "", currentTemperature: "", explanation: "")
}
