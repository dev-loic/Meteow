//
//  SettingsViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

struct SettingsViewModel {
    let sections: [SettingsSectionViewModel]
    
    static let empty = SettingsViewModel(sections: [])
}

struct SettingsSectionViewModel {
    let title: String
    let cells: [SettingsCellViewModel]
}

struct SettingsCellViewModel {
    let title: String
    let description: String?
}
