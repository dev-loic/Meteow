//
//  WeatherIcon.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import Foundation

enum WeatherIcon: Int {
    case sunny = 1
    case mostlySunny = 2
    case partlySunny = 3
    case intermittentClouds = 4
    case hazySunshine = 5
    case mostlyCloudy = 6
    case cloudy = 7
    case dreary = 8
    case fog = 11
    case showers = 12
    case mostlyCloudyWithShowers = 13
    case partlySunnyWithShowers = 14
    case tStorms = 15
    case mostlyCloudyWithTStorms = 16
    case partlySunnyWithTStorms = 17
    case rain = 18
    case flurries = 19
    case mostlyCloudyWithFlurries = 20
    case partlySunnyWithFlurries = 21
    case snow = 22
    case mostlyCloudyWithSnow = 23
    case ice = 24
    case sleet = 25
    case freezingRain = 26
    case rainAndSnow = 29
    case hot = 30
    case cold = 31
    case windy = 32
    case nightClear = 33
    case nightMostlyClear = 34
    case nightPartlyCloudy = 35
    case nightIntermittentClouds = 36
    case nightHazyMoonlight = 37
    case nightMostlyCloudy = 38
    case nightPartlyCloudyWithShowers = 39
    case nightMostlyCloudyWithShowers = 40
    case nightPartlyCloudyWithTStorms = 41
    case nightMostlyCloudyWithTStorms = 42
    case nightPartlyCloudyWithFlurries = 43
    case nightMostlyCloudyWithFlurries = 44
    
    var systemName: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .mostlySunny, .partlySunny, .intermittentClouds:
            return "cloud.sun.fill"
        case .hazySunshine:
            return "sun.haze.file"
        case .mostlyCloudy, .cloudy, .dreary:
            return "cloud.fill"
        case .fog:
            return "cloud.fog.fill"
        case .showers, .mostlyCloudyWithShowers, .flurries, .mostlyCloudyWithFlurries:
            return "cloud.rain.fill"
        case .partlySunnyWithShowers, .partlySunnyWithFlurries:
            return "cloud.sun.rain.fill"
        case .tStorms, .mostlyCloudyWithTStorms, .partlySunnyWithTStorms:
            return "sun.min"
        case .rain:
            return "cloud.heavyrain.fill"
        case .snow, .mostlyCloudyWithSnow:
            return "cloud.snow.fill"
        case .ice:
            return "cloud.hail.fill"
        case .sleet, .freezingRain, .rainAndSnow:
            return "cloud.sleet.fill"
        case .hot:
            return "thermometer.sun.fill"
        case .cold:
            return "thermometer.snowflake"
        case .windy:
            return "wind"
        case .nightClear:
            return "moon.stars.fill"
        case .nightMostlyClear, .nightPartlyCloudy:
            return "moon.fill"
        case .nightIntermittentClouds, .nightHazyMoonlight, .nightMostlyCloudy:
            return "cloud.moon.fill"
        case .nightPartlyCloudyWithShowers, .nightMostlyCloudyWithShowers, .nightPartlyCloudyWithFlurries, .nightMostlyCloudyWithFlurries:
            return "cloud.moon.rain.fill"
        case .nightPartlyCloudyWithTStorms, .nightMostlyCloudyWithTStorms:
            return "cloud.moon.bolt.fill"
        }
    }
}
