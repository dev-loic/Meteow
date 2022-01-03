//
//  CityViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

struct CityViewModel {
    let header: CityHeaderViewModel
    let cells: [CityCellViewModelType]
    
    static let empty = CityViewModel(header: .empty, cells: [])
}

enum CityCellViewModelType {
    case hoursDetails(CityHoursDetailsViewModel)
}
