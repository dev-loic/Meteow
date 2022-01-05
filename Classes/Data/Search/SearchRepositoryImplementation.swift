//
//  SearchRepositoryImplementation.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import Alamofire

class SearchRepositoryImplementation: SearchRepository {
    
    // MARK: - SearchRepository
    
    func retrieveCities(from queryString: String,
                        completion: @escaping (SearchResultsData) -> Void) {
        let baseURL = TargetSettings.baseURL
        let apiKey = TargetSettings.accuWeatherApiKey
        let request = AF.request("\(baseURL)/locations/v1/cities/autocomplete?apikey=\(apiKey)&q=\(queryString.queryized)")
        request.responseDecodable { (response: DataResponse<SearchResultsData, AFError>) in
            switch (response.result) {
            case let .success(data):
                completion(data)
            case let .failure(error):
                // TODO: (Loic Saillant) 2021/12/30 Should be completed
                print(error)
                completion([])
            }
        }
    }
}
