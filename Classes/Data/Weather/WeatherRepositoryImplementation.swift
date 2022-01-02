//
//  WeatherRepositoryImplementation.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation
import Alamofire

class WeatherRepositoryImplementation: WeatherRepository {
    
    private lazy var mapper = RestWeatherDataMapper()
    
    // MARK: - WeatherRepository
    
    func retrieveData(cityKey: String, completion: @escaping ([WeatherData]) -> Void) {
        let baseURL = TargetSettings.baseURL
        let apiKey = TargetSettings.accuWeatherApiKey
        let request = AF.request("\(baseURL)/forecasts/v1/hourly/1hour/\(cityKey)?apikey=\(apiKey)&details=true")
        request.responseDecodable { (response: DataResponse<[RestWeatherData], AFError>) in
            switch (response.result) {
            case let .success(data):
                completion(data.map { self.mapper.map(restData: $0) })
            case let .failure(error):
                // TODO: (Loic Saillant) 2021/12/30 Should be completed
                print(error)
                completion([])
            }
        }
    }
}
