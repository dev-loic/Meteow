//
//  SearchPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SearchPresenterImplementation: SearchPresenter {

    private weak var viewContract: SearchViewContract?
    private lazy var mapper = SearchViewModelMapper()

    init(viewContract: SearchViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - SearchPresenter

    func start() {
        viewContract?.display(mapper.map())
    }
}
