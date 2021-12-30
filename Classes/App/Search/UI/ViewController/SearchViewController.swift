//
//  SearchViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenter?
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    private lazy var dataSource = self.createDataSource()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter?.start()
    }
    
    // MARK: - Private
    
    private func createDataSource() -> SearchDataSource {
        let dataSource = SearchDataSource()
        dataSource.delegate = self
        return dataSource
    }
    
    private func setUpViews() {
        navigationItem.title = "search_navigation_bar_title".localized()
        dataSource.registerCells(in: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchBar.placeholder = "search_bar_placeholder".localized()
        searchBar.delegate = self
    }
}

extension SearchViewController: SearchViewContract {
    
    // MARK: - SearchViewContract
}

extension SearchViewController: SearchDataSourceDelegate {
    
    // MARK: - SearchDataSourceDelegate
}

extension SearchViewController: UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // ???: (Loic Saillant) 2021/12/30 I choose not to send a request at each letter,
        // like a true autocomplete because I am limited to 50 calls/day with free plan
        // TODO: (Loic Saillant) 2021/12/30 Send request to get cities
    }
}
