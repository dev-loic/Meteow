//
//  CitiesRepositoryImplementation.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

class CitiesRepositoryImplementation: CitiesRepository {
    
    private let userDefaults: UserDefaults = .standard
    private enum Key: String {
        case favoriteCities
    }
    
    // MARK: - CitiesRepository
    
    func addFavorite(_ city: City) {
        guard isKeyExisting(.favoriteCities) else {
            setValue([] as? [City], for: .favoriteCities)
            return
        }
        guard let currentFavoriteCities: [City] = readValue(for: .favoriteCities) else { return }
        var newFavorites = currentFavoriteCities
        newFavorites.append(city)
        setValue(newFavorites, for: .favoriteCities)
    }
    
    func retrieveFavoriteCities() -> [City] {
        return readValue(for: .favoriteCities) ?? []
    }
    
    // MARK: - Private
    
    private func readValue<T>(for key: Key) -> T? {
        return userDefaults.value(forKey: key.rawValue) as? T
    }
    
    private func setValue(_ value: Any?, for key: Key) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    private func isKeyExisting(_ key: Key) -> Bool {
        return userDefaults.object(forKey: key.rawValue) != nil
    }
}
