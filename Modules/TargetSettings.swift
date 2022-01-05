//
//  TargetSettings.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

struct TargetSettings {

    // TODO: (Loic Saillant) 2021/12/30 We should have a singleton decoding plist and conforms to Decodable protocol
    // For now we stay with hardcoded values as there is not different environments
    static var baseURL: String = "http://dataservice.accuweather.com"
    static var accuWeatherApiKey: String = "GNwjKKxmSCCOns6svvMz7JNGIjGAOAGP"
}
