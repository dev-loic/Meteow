//
//  RestWeatherDataMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

class RestWeatherDataMapper {
    
    // MARK: - RestWeatherDataMapper
    
    func map(restData: RestWeatherData) -> WeatherData {
        let celsiusTemperature = integerCelsiusTemperature(fromFahrenheitValue: restData.Temperature.Value)
        return WeatherData(
            temperature: celsiusTemperature,
            explanation: restData.IconPhrase,
            icon: WeatherIcon(rawValue: restData.WeatherIcon)
        )
    }
    
    // MARK: - Private
    
    private func integerCelsiusTemperature(fromFahrenheitValue value: Double) -> Int {
        let celsiusTemperature = ((value - 32) * 5) / 9
        return Int(round(celsiusTemperature))
    }
}
