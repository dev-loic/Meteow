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
    
    func map(cityKeys: [String]) -> CitiesViewModel {
        CitiesViewModel(controllers: cityKeys.map { self.mapCity(key: $0) })
    }
    
    // MARK: - Private
    
    private func mapCity(key: String) -> UIViewController {
        let viewController = CityViewController()
        let weatherRepository = WeatherRepositoryImplementation()
        let presenter = CityPresenterImplementation(
            key: key,
            viewContract: viewController,
            weatherRepository: weatherRepository
        )
        viewController.presenter = presenter
        return viewController
    }
}
