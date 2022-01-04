//
//  SettingsViewModelMapper.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

class SettingsViewModelMapper {
    
    // MARK: - SettingsViewModelMapper
    
    func map(appVersion: String) -> SettingsViewModel {
        let sections = [
            informationSection(appVersion: appVersion)
        ].compactMap { $0 }
        return SettingsViewModel(sections: sections)
    }
    
    // MARK: - Private
    
    private func informationSection(appVersion: String) -> SettingsSectionViewModel {
        let cells = [SettingsCellViewModel(title: "settings_app_version_cell_title".localized(), description: appVersion)]
        return SettingsSectionViewModel(title: "settings_information_section_title".localized(), cells: cells)
    }
}
