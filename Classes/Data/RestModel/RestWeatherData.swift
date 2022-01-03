//
//  RestWeatherData.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

struct RestWeatherData: Decodable {
    let Temperature: TemperatureData
    let IconPhrase: String
}

struct TemperatureData: Decodable {
    let Value: Double
}
