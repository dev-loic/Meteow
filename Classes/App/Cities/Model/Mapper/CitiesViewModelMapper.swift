//
//  CitiesViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import UIKit

class CitiesViewModelMapper {
    
    private lazy var cityMapper = CityViewModelMapper()
    
    // MARK: - CitiesViewModelMapper
    
    func map(cities: [City]) -> CitiesViewModel {
        CitiesViewModel(controllers: cities.map { self.mapCity(from: $0) })
    }
    
    // MARK: - Private
    
    private func mapCity(from city: City) -> UIViewController {
        let viewController = CityViewController()
        let weatherRepository = WeatherRepositoryImplementation()
        let presenter = CityPresenterImplementation(
            city: city,
            viewContract: viewController,
            weatherRepository: weatherRepository
        )
        viewController.presenter = presenter
        return viewController
    }
}
