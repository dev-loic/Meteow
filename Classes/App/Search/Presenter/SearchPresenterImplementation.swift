//
//  SearchPresenterImplementation.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

class SearchPresenterImplementation: SearchPresenter {

    private let repository: SearchRepository
    private weak var viewContract: SearchViewContract?
    private lazy var mapper = SearchViewModelMapper()
    private var searchResults: SearchResultsData = .empty

    init(viewContract: SearchViewContract, repository: SearchRepository) {
        self.viewContract = viewContract
        self.repository = repository
    }

    // MARK: - SearchPresenter

    func start() {
        viewContract?.display(mapper.map(from: .empty))
    }
    
    func search(_ query: String) {
        repository.retrieveCities(from: query) { results in
            self.searchResults = results
            self.viewContract?.display(self.mapper.map(from: self.searchResults))
        }
    }
}
