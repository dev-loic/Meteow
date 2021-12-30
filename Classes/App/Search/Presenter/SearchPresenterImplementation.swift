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
    private var searchResults: SearchResultsData = []

    init(viewContract: SearchViewContract, repository: SearchRepository) {
        self.viewContract = viewContract
        self.repository = repository
    }

    // MARK: - SearchPresenter

    func start() {
        clearSearch()
    }
    
    func search(_ query: String) {
        repository.retrieveCities(from: query) { results in
            self.searchResults = results
            self.viewContract?.display(self.mapper.map(from: self.searchResults))
        }
    }
    
    func clearSearch() {
        viewContract?.display(mapper.map(from: []))
    }
    
    func selectCity(at index: Int) {
        // TODO: (Loic Saillant) 2021/12/30 To implement
    }
}
