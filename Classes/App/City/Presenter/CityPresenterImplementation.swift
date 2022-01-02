//
//  CityPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class CityPresenterImplementation: CityPresenter {

    private let key: String
    private weak var viewContract: CityViewContract?
    private let weatherRepository: WeatherRepository
    private lazy var mapper = CityViewModelMapper()

    init(key: String, viewContract: CityViewContract, weatherRepository: WeatherRepository) {
        self.key = key
        self.viewContract = viewContract
        self.weatherRepository = weatherRepository
    }

    // MARK: - CityPresenter

    func start() {
        weatherRepository.retrieveData(cityKey: key) { data in
            let viewModel = self.mapper.map(data: data)
            self.viewContract?.display(viewModel)
        }
    }
}
