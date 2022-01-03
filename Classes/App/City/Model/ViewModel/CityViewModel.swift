//
//  CityViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

struct CityViewModel {
    let header: CityHeaderViewModel
    let hoursDetails: CityHoursDetailsViewModel
    
    static let empty = CityViewModel(header: .empty, hoursDetails: .empty)
}
