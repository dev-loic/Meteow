//
//  SearchResultsData.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

typealias SearchResultsData = [SearchResultCity]

struct SearchResultCity: Decodable {
    let key: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case name = "LocalizedName"
      }
}
