//
//  CityPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class CityPresenterImplementation: CityPresenter {

    private weak var viewContract: CityViewContract?

    init(viewContract: CityViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - CityPresenter

    func start() {
        // TODO: (Loic Saillant) 2021/12/30 To complete
    }
}
