//
//  WeatherRepository.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation

protocol WeatherRepository {
    func retrieveData(cityKey: String, completion: @escaping ([WeatherData]) -> Void)
}
