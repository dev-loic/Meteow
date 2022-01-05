//
//  SearchPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SearchPresenterImplementation: SearchPresenter {

    weak var delegate: SearchPresenterDelegate?
    
    private let searchRepository: SearchRepository
    private let citiesRepository: CitiesRepository
    private weak var viewContract: SearchViewContract?
    private lazy var mapper = SearchViewModelMapper()
    private var searchResults: SearchResultsData = []
    private var favoriteCities: [City] = []

    init(viewContract: SearchViewContract,
         searchRepository: SearchRepository,
         citiesRepository: CitiesRepository) {
        self.viewContract = viewContract
        self.searchRepository = searchRepository
        self.citiesRepository = citiesRepository
    }

    // MARK: - SearchPresenter

    func start() {
        favoriteCities = citiesRepository.retrieveFavoriteCities()
        clearSearch()
    }
    
    func refresh() {
        refreshFavorites()
    }
    
    func search(_ query: String) {
        searchRepository.retrieveCities(from: query) { results in
            self.searchResults = results
            let viewModel = self.mapper.map(from: self.searchResults, favoriteCities: self.favoriteCities)
            self.viewContract?.display(viewModel)
        }
    }
    
    func clearSearch() {
        searchResults = []
        viewContract?.display(mapper.map(from: searchResults, favoriteCities: favoriteCities))
    }
    
    func selectCity(at index: Int) {
        let citySearchResult = searchResults[index]
        // TODO: (Loic Saillant) 2021/12/30 Should have a mapper here
        let city = City(
            key: citySearchResult.key,
            name: citySearchResult.name,
            countryName: citySearchResult.country.name
        )
        citiesRepository.addFavorite(city)
        clearSearch()
        delegate?.searchPresenter(self, didSelect: city)
    }
    
    func removeFavorite(at index: Int) {
        let favoriteCity = favoriteCities[index]
        citiesRepository.removeFavorite(favoriteCity)
        refreshFavorites()
        if favoriteCities.count == 0 {
            delegate?.searchPresenterDidRemoveAllCities(self)
        }
    }
    
    // MARK: - Private
    
    private func refreshFavorites() {
        favoriteCities = citiesRepository.retrieveFavoriteCities()
        let viewModel = mapper.map(from: searchResults, favoriteCities: favoriteCities)
        viewContract?.display(viewModel)
    }
}
