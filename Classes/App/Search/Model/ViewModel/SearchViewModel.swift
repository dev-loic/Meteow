//
//  SearchViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

struct SearchViewModel {
    let cells: [SearchCellViewModel]
    
    static let empty = SearchViewModel(cells: [])
}

struct SearchCellViewModel {
    let title: String
}
