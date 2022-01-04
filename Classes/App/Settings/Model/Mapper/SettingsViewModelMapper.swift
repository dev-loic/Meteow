//
//  SettingsViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

class SettingsViewModelMapper {
    
    // MARK: - SettingsViewModelMapper
    
    func map(fromFavoriteCities favoriteCities: [City], appVersion: String) -> SettingsViewModel {
        let sections = [
            favoritesSection(favoriteCities),
            informationSection(appVersion: appVersion)
        ].compactMap { $0 }
        return SettingsViewModel(sections: sections)
    }
    
    // MARK: - Private
    
    private func favoritesSection(_ cities: [City]) -> SettingsSectionViewModel? {
        guard cities.count > 0 else { return nil }
        let cells = cities.map { SettingsCellViewModel(title: $0.name, description: $0.countryName) }
        return SettingsSectionViewModel(title: "settings_favorites_section_title".localized(), cells: cells)
    }
    
    private func informationSection(appVersion: String) -> SettingsSectionViewModel {
        let cells = [SettingsCellViewModel(title: "settings_app_version_cell_title".localized(), description: appVersion)]
        return SettingsSectionViewModel(title: "settings_information_section_title".localized(), cells: cells)
    }
}
