//
//  SearchViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

struct SearchViewModel {
    let sections: [SearchSectionViewModel]
    
    static let empty = SearchViewModel(sections: [])
}

struct SearchSectionViewModel {
    let title: String
    let cells: [SearchCellViewModel]
}

struct SearchCellViewModel {
    let title: String
}
