//
//  CityViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

class CityViewModelMapper {
    
    // MARK: - CityViewModelMapper
    
    func map(city: City, data: [WeatherData]) -> CityViewModel {
        guard data.count > 0 else { return .empty }
        let currentWeatherData = data[0]
        let header = CityHeaderViewModel(
            cityName: city.name,
            countryName: city.countryName,
            currentTemperature: String(currentWeatherData.temperature.celsiusValue),
            explanation: currentWeatherData.explanation,
            weatherIconImage: .weatherImage(currentWeatherData.icon)
        )
        return CityViewModel(
            header: header,
            cells: [
                .hoursDetails(hoursDetailsViewModel(data: data)),
                .moreDetails(moreDetailsViewModel(data: data))
            ]
        )
    }
    
    func mapPlaceholder(city: City) -> CityViewModel {
        let header = CityHeaderViewModel(
            cityName: city.name,
            countryName: city.countryName,
            currentTemperature: String(format: "celsius_format".localized(), "-"),
            explanation: "-",
            weatherIconImage: .weatherImage(.sunny)
        )
        return CityViewModel(
            header: header,
            cells: [
                .hoursDetails(.empty),
                .moreDetails(placeholderMoreDetailsViewModel())
            ]
        )
    }
    
    // MARK: - Private
    
    private func hoursDetailsViewModel(data: [WeatherData]) -> CityHoursDetailsViewModel {
        let cells = data.enumerated().map { offset, data in
            CityHoursDetailsCellViewModel(
                hour: offset == 0 ? "Now" : mapHour(from: data.date),
                weatherIconImage: .weatherImage(data.icon),
                temperature: data.temperature.celsiusValue
            )
        }
        return CityHoursDetailsViewModel(cells: cells)
    }
    
    private func mapHour(from date: Date?) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return String(format: "hours_format".localized(), dateFormatter.string(from: date))
    }
    
    private func moreDetailsViewModel(data: [WeatherData]) -> CityMoreDetailsViewModel {
        let moreDetails: [CityMoreDetailsType] = [
            .realFeelTemperature,
            .windSpeed,
            .windDirection,
            .uvIndex
        ]
        let cells = moreDetails.map { cityMoreDetailsCellViewModel(for: $0, data[0]) }
        return CityMoreDetailsViewModel(cells: cells)
    }
    
    private func placeholderMoreDetailsViewModel() -> CityMoreDetailsViewModel {
        let moreDetails: [CityMoreDetailsType] = [
            .realFeelTemperature,
            .windSpeed,
            .windDirection,
            .uvIndex
        ]
        let cells = moreDetails.map { placeholderCityMoreDetailsCellViewModel(for: $0) }
        return CityMoreDetailsViewModel(cells: cells)
    }
    
    private func cityMoreDetailsCellViewModel(for type: CityMoreDetailsType,
                                              _ data: WeatherData) -> CityMoreDetailsCellViewModel {
        let value: String
        switch type {
        case .realFeelTemperature:
            value = data.realFeelTemperature.celsiusValue
        case .windSpeed:
            value = data.wind.speed.kmhValue
        case .windDirection:
            value = data.wind.direction
        case .uvIndex:
            value = data.uvIndex
        }
        return CityMoreDetailsCellViewModel(title: title(for: type), value: value)
    }
    
    private func placeholderCityMoreDetailsCellViewModel(for type: CityMoreDetailsType) -> CityMoreDetailsCellViewModel {
        let value: String
        switch type {
        case .realFeelTemperature:
            value = String(format: "celsius_format".localized(), "-")
        case .windSpeed:
            value = String(format: "kmh_format".localized(), "-")
        case .windDirection:
            value = "-"
        case .uvIndex:
            value = "-"
        }
        return CityMoreDetailsCellViewModel(title: title(for: type), value: value)
    }
    
    private func title(for type: CityMoreDetailsType) -> String {
        switch type {
        case .realFeelTemperature:
            return "real_feel_temperature_title".localized()
        case .windSpeed:
            return "wind_speed_title".localized()
        case .windDirection:
            return "wind_direction_title".localized()
        case .uvIndex:
            return "uv_index_title".localized()
        }
    }
}
