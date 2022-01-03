//
//  CityViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

class CityViewModelMapper {
    
    // MARK: - CityViewModelMapper
    
    func map(cityName: String, data: [WeatherData]) -> CityViewModel {
        // TODO: (Loic Saillant) 2022/01/02 To complete
        guard data.count > 0 else { return .empty }
        let currentWeatherData = data[0]
        let header = CityHeaderViewModel(
            cityName: cityName,
            currentTemperature: String(currentWeatherData.temperature.celsiusValue),
            explanation: currentWeatherData.explanation,
            weatherIconImage: .weatherImage(currentWeatherData.icon)
        )
        return CityViewModel(header: header)
    }
}
