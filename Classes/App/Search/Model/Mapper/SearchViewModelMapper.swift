//
//  SearchViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

class SearchViewModelMapper {
    
    // MARK: - SearchViewModelMapper
    
    func map(from results: SearchResultsData, favoriteCities: [City]) -> SearchViewModel {
        let sections = [
            searchResultsSection(from: results),
            favoritesSection(from: favoriteCities)
        ]
        .compactMap { $0 }
        return SearchViewModel(sections: sections)
    }
    
    // MARK: - Private
    
    private func searchResultsSection(from results: SearchResultsData) -> SearchSectionViewModel? {
        guard results.count > 0 else { return nil }
        let cells: [SearchCellViewModelType] = results.map { result in
            .searchResult(SearchResultCellViewModel(title: result.name))
        }
        return SearchSectionViewModel(
            title: "search_results_section_title".localized(),
            cells: cells
        )
    }
    
    private func favoritesSection(from cities: [City]) -> SearchSectionViewModel? {
        guard cities.count > 0 else { return nil }
        let cells: [SearchCellViewModelType] = cities.map {
            .favorite(FavoriteCellViewModel(title: $0.name, description: $0.countryName))
        }
        return SearchSectionViewModel(title: "search_favorites_section_title".localized(), cells: cells)
    }
}
