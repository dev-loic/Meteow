//
//  SearchPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SearchPresenterImplementation: SearchPresenter {

    private let searchRepository: SearchRepository
    private let citiesRepository: CitiesRepository
    private weak var viewContract: SearchViewContract?
    private lazy var mapper = SearchViewModelMapper()
    private var searchResults: SearchResultsData = []

    init(viewContract: SearchViewContract,
         searchRepository: SearchRepository,
         citiesRepository: CitiesRepository) {
        self.viewContract = viewContract
        self.searchRepository = searchRepository
        self.citiesRepository = citiesRepository
    }

    // MARK: - SearchPresenter

    func start() {
        clearSearch()
    }
    
    func search(_ query: String) {
        searchRepository.retrieveCities(from: query) { results in
            self.searchResults = results
            self.viewContract?.display(self.mapper.map(from: self.searchResults))
        }
    }
    
    func clearSearch() {
        viewContract?.display(mapper.map(from: []))
    }
    
    func selectCity(at index: Int) {
        let citySearchResult = searchResults[index]
        // TODO: (Loic Saillant) 2021/12/30 Should have a mapper here
        let city = City(key: citySearchResult.key, name: citySearchResult.name)
        citiesRepository.addFavorite(city)
    }
}
