//
//  SettingsRepositoryImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 04/01/2022.
//
//
//

import Foundation

public class SettingsRepositoryImplementation: SettingsRepository {

    // MARK: - SettingsRepository

    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
}
