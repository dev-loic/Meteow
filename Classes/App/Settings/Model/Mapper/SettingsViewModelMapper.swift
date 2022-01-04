//
//  SettingsViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

class SettingsViewModelMapper {
    
    // MARK: - SettingsViewModelMapper
    
    func map(fromFavoriteCities favoriteCities: [City]) -> SettingsViewModel {
        let cells = favoriteCities.map { SettingsCellViewModel(title: $0.name) }
        let favoriteSection = SettingsSectionViewModel(title: "settings_favorites_section_title".localized(), cells: cells)
        return SettingsViewModel(sections: [favoriteSection])
    }
}
