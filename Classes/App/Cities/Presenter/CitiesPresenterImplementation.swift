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

    init(viewContract: CitiesViewContract, repository: CitiesRepository) {
        self.viewContract = viewContract
        self.repository = repository
    }

    // MARK: - CitiesPresenter

    func start() {
        let favoriteCities = repository.retrieveFavoriteCities()
        viewContract?.display(mapper.map(cityKeys: favoriteCities.map { $0.key }))
    }
}
