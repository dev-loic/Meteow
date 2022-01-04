//
//  RestWeatherData.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

struct RestWeatherData: Decodable {
    let Temperature: ValueData
    let RealFeelTemperature: ValueData
    let IconPhrase: String
    let WeatherIcon: Int
    let DateTime: String
    let Wind: WindData
}

struct ValueData: Decodable {
    let Value: Double
}

struct WindData: Decodable {
    let Speed: ValueData
    let Direction: DirectionData
}

struct DirectionData: Decodable {
    let Localized: String
}
