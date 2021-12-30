//
//  SearchViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

class SearchViewModelMapper {
    
    // MARK: - SearchViewModelMapper
    
    func map(from results: SearchResultsData) -> SearchViewModel {
        let cells = results.map { result in
            return SearchCellViewModel(title: result.name)
        }
        return SearchViewModel(cells: cells)
    }
}
