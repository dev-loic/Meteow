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
        let sections = [
            searchResultsSection(from: results)
        ]
        .compactMap { $0 }
        return SearchViewModel(sections: sections)
    }
    
    // MARK: - Private
    
    private func searchResultsSection(from results: SearchResultsData) -> SearchSectionViewModel? {
        guard results.count > 0 else { return nil }
        let cells = results.map { result in
            return SearchCellViewModel(title: result.name)
        }
        return SearchSectionViewModel(
            title: "search_results_section_title".localized(),
            cells: cells
        )
    }
}
