//
//  CityViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

class CityViewModelMapper {
    
    // MARK: - CityViewModelMapper
    
    func map(data: [WeatherData]) -> CityViewModel {
        // TODO: (Loic Saillant) 2022/01/02 To complete
        guard data.count > 0 else { return .empty }
        return CityViewModel(currentTemperature: String(data[0].temperature.celsiusValue))
    }
}
