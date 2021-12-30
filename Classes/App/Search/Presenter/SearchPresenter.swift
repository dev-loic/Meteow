//
//  SearchPresenter.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation

protocol SearchPresenter {
    func start()
    func search(_ query: String)
    func clearSearch()
}
