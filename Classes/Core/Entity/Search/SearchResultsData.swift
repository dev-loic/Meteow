//
//  SearchResultsData.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

struct SearchResultsData {
    let cities: [SearchResultCity]
    
    static let empty = SearchResultsData(cities: [])
}

struct SearchResultCity {
    let key: String
    let name: String
}
