//
//  CitiesPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class CitiesPresenterImplementation: CitiesPresenter {

    private weak var viewContract: CitiesViewContract?
    private lazy var mapper = CitiesViewModelMapper()
    private let repository: CitiesRepository
    private var favoriteCities: [City] = []

    init(viewContract: CitiesViewContract, repository: CitiesRepository) {
        self.viewContract = viewContract
        self.repository = repository
    }

    // MARK: - CitiesPresenter

    func start() {
        favoriteCities = repository.retrieveFavoriteCities()
        refreshView()
    }
    
    func refreshIfNeeded() {
        let currentFavoriteCities = repository.retrieveFavoriteCities()
        let longestCitiesList = currentFavoriteCities.count > favoriteCities.count ? currentFavoriteCities : favoriteCities
        let shortestCitiesList = currentFavoriteCities.count > favoriteCities.count ? favoriteCities : currentFavoriteCities
        let needRefreshCities = longestCitiesList.filter { city in
            !shortestCitiesList.contains(where: { $0.key == city.key })
        }
        guard needRefreshCities.count > 0 else { return }
        favoriteCities = currentFavoriteCities
        refreshView()
    }
    
    // MARK: - Private
    
    private func refreshView() {
        viewContract?.display(mapper.map(cities: favoriteCities))
    }
}
