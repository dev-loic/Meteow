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
        let viewModel = self.mapper.mapPlaceholder(city: city)
        viewContract?.display(viewModel)
        weatherRepository.retrieveData(cityKey: city.key) { data in
            guard data.count > 0 else { return }
            let viewModel = self.mapper.map(city: self.city, data: data)
            self.viewContract?.display(viewModel)
        }
    }
}
