//
//  CitiesRepository.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

protocol CitiesRepository {
    func addFavorite(_ city: City)
    func retrieveFavoriteCities() -> [City]
}
