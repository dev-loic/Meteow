//
//  SettingsPresenter.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

protocol SettingsPresenterDelegate: AnyObject {
    func settingsPresenterDidRemoveAllCities(_ presenter: SettingsPresenter)
}

protocol SettingsPresenter {
    func start()
    func removeFavorite(at index: Int)
}
