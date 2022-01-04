//
//  CitiesRepository.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

protocol CitiesRepository {
    var hasFavorites: Bool { get }
    func addFavorite(_ city: City)
    func removeFavorite(_ city: City)
    func retrieveFavoriteCities() -> [City]
}
