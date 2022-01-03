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
        return CityViewModel(
            header: header,
            cells: [
                .hoursDetails(hoursDetailsViewModel(data: data))
            ]
        )
    }
    
    // MARK: - Private
    
    private func hoursDetailsViewModel(data: [WeatherData]) -> CityHoursDetailsViewModel {
        let cells = data.enumerated().map { offset, data in
            // TODO: (Loic Saillant) 2022/01/03 Correctly map hour
            CityHoursDetailsCellViewModel(
                hour: offset == 0 ? "Now" : "10h",
                weatherIconImage: .weatherImage(data.icon),
                temperature: data.temperature.celsiusValue
            )
        }
        return CityHoursDetailsViewModel(cells: cells)
    }
}
