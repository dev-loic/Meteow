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

    init(viewContract: SearchViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - SearchPresenter

    func start() {
        // TODO: (Loic Saillant) 2021/30/12 To complete
    }
}
