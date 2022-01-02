//
//  CityPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class CityPresenterImplementation: CityPresenter {

    private let city: City
    private weak var viewContract: CityViewContract?
    private let weatherRepository: WeatherRepository
    private lazy var mapper = CityViewModelMapper()

    init(city: City, viewContract: CityViewContract, weatherRepository: WeatherRepository) {
        self.city = city
        self.viewContract = viewContract
        self.weatherRepository = weatherRepository
    }

    // MARK: - CityPresenter

    func start() {
        weatherRepository.retrieveData(cityKey: city.key) { data in
            let viewModel = self.mapper.map(cityName: self.city.name, data: data)
            self.viewContract?.display(viewModel)
        }
    }
}
