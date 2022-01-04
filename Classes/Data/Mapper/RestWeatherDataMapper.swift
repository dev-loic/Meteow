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
        let celsiusRealFeelTemperature = integerCelsiusTemperature(fromFahrenheitValue: restData.RealFeelTemperature.Value)
        return WeatherData(
            temperature: celsiusTemperature,
            realFeelTemperature: celsiusRealFeelTemperature,
            explanation: restData.IconPhrase,
            icon: WeatherIcon(rawValue: restData.WeatherIcon),
            date: date(from: restData.DateTime),
            wind: wind(from: restData),
            uvIndex: restData.UVIndexText
        )
    }
    
    // MARK: - Private
    
    private func integerCelsiusTemperature(fromFahrenheitValue value: Double) -> Int {
        let celsiusTemperature = ((value - 32) * 5) / 9
        return Int(round(celsiusTemperature))
    }
    
    private func date(from value: String) -> Date? {
        return try? Date(value, strategy: .iso8601)
    }
    
    private func wind(from data: RestWeatherData) -> WindWeatherData {
        return WindWeatherData(
            speed: integerKilometersPerHourSpeed(fromSpeed: data.Wind.Speed.Value),
            direction: data.Wind.Direction.Localized
        )
    }
    
    private func integerKilometersPerHourSpeed(fromSpeed speed: Double) -> Int {
        let kmhValue = speed * 1.60934
        return Int(round(kmhValue))
    }
}
