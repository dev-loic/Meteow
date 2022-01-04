//
//  SettingsPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SettingsPresenterImplementation: SettingsPresenter {

    private weak var viewContract: SettingsViewContract?
    private let citiesRepository: CitiesRepository
    private lazy var mapper = SettingsViewModelMapper()

    init(viewContract: SettingsViewContract, citiesRepository: CitiesRepository) {
        self.viewContract = viewContract
        self.citiesRepository = citiesRepository
    }

    // MARK: - SettingsPresenter

    func start() {
        let favoriteCities = citiesRepository.retrieveFavoriteCities()
        viewContract?.display(mapper.map(fromFavoriteCities: favoriteCities))
    }
}
