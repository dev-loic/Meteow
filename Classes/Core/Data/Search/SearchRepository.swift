//
//  SearchRepository.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

protocol SearchRepository {
    func retrieveCities(from queryString: String,
                        completion: @escaping (SearchResultsData) -> Void)
}
