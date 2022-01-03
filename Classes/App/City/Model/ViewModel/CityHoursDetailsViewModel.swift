//
//  CityHoursDetailsViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

struct CityHoursDetailsViewModel {
    let cells: [CityHoursDetailsCellViewModel]
    
    static let empty = CityHoursDetailsViewModel(cells: [])
}

struct CityHoursDetailsCellViewModel {
    let temperature: String
}
