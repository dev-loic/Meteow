//
//  SettingsPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SettingsPresenterImplementation: SettingsPresenter {

    weak var delegate: SettingsPresenterDelegate?
    
    private weak var viewContract: SettingsViewContract?
    private let citiesRepository: CitiesRepository
    private let settingsRepository: SettingsRepository
    private lazy var mapper = SettingsViewModelMapper()
    private var favoriteCities: [City] = []

    init(viewContract: SettingsViewContract,
         citiesRepository: CitiesRepository,
         settingsRepository: SettingsRepository) {
        self.viewContract = viewContract
        self.citiesRepository = citiesRepository
        self.settingsRepository = settingsRepository
    }

    // MARK: - SettingsPresenter

    func start() {
        refresh()
    }
    
    func removeFavorite(at index: Int) {
        citiesRepository.removeFavorite(favoriteCities[index])
        if (!citiesRepository.hasFavorites) {
            delegate?.settingsPresenterDidRemoveAllCities(self)
        }
        refresh()
    }
    
    // MARK: - Private
    
    private func refresh() {
        favoriteCities = citiesRepository.retrieveFavoriteCities()
        let viewModel = mapper.map(fromFavoriteCities: favoriteCities, appVersion: settingsRepository.appVersion)
        viewContract?.display(viewModel)
    }
}
