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
    private lazy var mapper = CitiesViewModelMapper()

    init(viewContract: CitiesViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - CitiesPresenter

    func start() {
        viewContract?.display(mapper.map())
    }
}
