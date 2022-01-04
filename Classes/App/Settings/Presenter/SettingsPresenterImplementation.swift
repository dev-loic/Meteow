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
    private let settingsRepository: SettingsRepository
    private lazy var mapper = SettingsViewModelMapper()
    private var favoriteCities: [City] = []

    init(viewContract: SettingsViewContract,
         settingsRepository: SettingsRepository) {
        self.viewContract = viewContract
        self.settingsRepository = settingsRepository
    }

    // MARK: - SettingsPresenter

    func start() {
        let viewModel = mapper.map(appVersion: settingsRepository.appVersion)
        viewContract?.display(viewModel)
    }
}
