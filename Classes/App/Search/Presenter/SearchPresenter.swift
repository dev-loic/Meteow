//
//  SearchPresenter.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

protocol SearchPresenterDelegate: AnyObject {
    func searchPresenter(_ presenter: SearchPresenter, didSelect city: City)
    func searchPresenterDidRemoveAllCities(_ presenter: SearchPresenter)
}

protocol SearchPresenter {
    func start()
    func refresh()
    func search(_ query: String, completion: @escaping () -> Void)
    func clearSearch()
    func selectCity(at index: Int)
    func removeFavorite(at index: Int)
}
