//
//  SearchViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

struct SearchViewModel {
    let placeholderBackground: PlaceholderBackgroundViewModel?
    let sections: [SearchSectionViewModel]
    
    static let empty = SearchViewModel(placeholderBackground: nil, sections: [])
}

struct PlaceholderBackgroundViewModel {
    let text: String
}

struct SearchSectionViewModel {
    let title: String
    let cells: [SearchCellViewModelType]
}

enum SearchCellViewModelType {
    case searchResult(SearchResultCellViewModel)
    case favorite(FavoriteCellViewModel)
}

struct SearchResultCellViewModel {
    let title: String
}

struct FavoriteCellViewModel {
    let title: String
    let description: String
}
