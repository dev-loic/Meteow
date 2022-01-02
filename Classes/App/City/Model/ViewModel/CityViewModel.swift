//
//  CityViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

struct CityViewModel {
    let header: CityHeaderViewModel
    
    static let empty = CityViewModel(header: .empty)
}
