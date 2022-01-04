//
//  CitiesRepositoryImplementation.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

class CitiesRepositoryImplementation: CitiesRepository {
    
    private let userDefaults: UserDefaults = .standard
    private lazy var encoder = JSONEncoder()
    private lazy var decoder = JSONDecoder()
    private enum Key: String {
        case favoriteCities
    }
    
    // MARK: - CitiesRepository
    
    func addFavorite(_ city: City) {
        var newFavorites = retrieveFavoriteCities()
        guard !newFavorites.contains(where: { $0.key == city.key }) else { return }
        newFavorites.append(city)
        setValue(encodeCities(newFavorites), for: .favoriteCities)
    }
    
    func retrieveFavoriteCities() -> [City] {
        guard let data = readData(for: .favoriteCities) else { return [] }
        return decodeCities(from: data)
    }
    
    // MARK: - Private
    
    private func encodeCities(_ cities: [City]) -> Data? {
        return try? encoder.encode(cities)
    }
    
    private func decodeCities(from data: Data) -> [City] {
        return (try? decoder.decode([City].self, from: data)) ?? []
    }
    
    private func readData(for key: Key) -> Data? {
        return userDefaults.data(forKey: key.rawValue)
    }
    
    private func setValue(_ value: Any?, for key: Key) {
        userDefaults.set(value, forKey: key.rawValue)
    }
}
