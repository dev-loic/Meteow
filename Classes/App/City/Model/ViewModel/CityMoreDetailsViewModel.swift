//
//  CityMoreDetailsViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import Foundation

struct CityMoreDetailsViewModel {
    let cells: [CityMoreDetailsCellViewModel]
    
    static let empty = CityMoreDetailsViewModel(cells: [])
}

struct CityMoreDetailsCellViewModel {
    let title: String
    let value: String
}

enum CityMoreDetailsType {
    case realFeelTemperature
    case windSpeed
    case windDirection
}
