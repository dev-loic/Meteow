//
//  CitiesPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class CitiesPresenterImplementation: CitiesPresenter {

    private weak var viewContract: CitiesViewContract?

    init(viewContract: CitiesViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - CitiesPresenter

    func start() {
        // TODO: (Loic Saillant) 2021/12/30 To implement
    }
}
