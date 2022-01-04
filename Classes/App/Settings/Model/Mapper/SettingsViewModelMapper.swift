//
//  SettingsViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

class SettingsViewModelMapper {
    
    // MARK: - SettingsViewModelMapper
    
    func map(fromFavoriteCities favoriteCities: [City]) -> SettingsViewModel {
        let sections = [favoriteSection(favoriteCities)].compactMap { $0 }
        return SettingsViewModel(sections: sections)
    }
    
    // MARK: - Private
    
    private func favoriteSection(_ cities: [City]) -> SettingsSectionViewModel? {
        guard cities.count > 0 else { return nil }
        let cells = cities.map { SettingsCellViewModel(title: $0.name) }
        return SettingsSectionViewModel(title: "settings_favorites_section_title".localized(), cells: cells)
    }
}
