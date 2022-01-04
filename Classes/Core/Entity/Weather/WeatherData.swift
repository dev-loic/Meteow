//
//  WeatherData.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

struct WeatherData {
    let temperature: Int
    let realFeelTemperature: Int
    let explanation: String
    let icon: WeatherIcon?
    let date: Date?
    let wind: WindWeatherData
    let uvIndex: String
}

struct WindWeatherData {
    let speed: Int
    let direction: String
}
