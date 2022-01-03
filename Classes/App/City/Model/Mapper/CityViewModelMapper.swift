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
        guard data.count > 0 else { return .empty }
        let currentWeatherData = data[0]
        let header = CityHeaderViewModel(
            cityName: cityName,
            currentTemperature: String(currentWeatherData.temperature.celsiusValue),
            explanation: currentWeatherData.explanation,
            weatherIconImage: .weatherImage(currentWeatherData.icon)
        )
        let hoursDetailsCells = data.map { CityHoursDetailsCellViewModel(temperature: String($0.temperature)) }
        return CityViewModel(
            header: header,
            cells: [
                .hoursDetails(CityHoursDetailsViewModel(cells: hoursDetailsCells))
            ]
        )
    }
}
