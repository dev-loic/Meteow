//
//  SettingsPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SettingsPresenterImplementation: SettingsPresenter {

    private weak var viewContract: SettingsViewContract?

    init(viewContract: SettingsViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - SettingsPresenter

    func start() {
        // TODO: (Loic Saillant) 2021/12/30 To complete
    }
}
